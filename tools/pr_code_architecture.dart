import 'dart:io';

void main() {
  // Fetch the base and head branch references from environment variables
  final baseRef = Platform.environment['GITHUB_BASE_REF'];
  final headRef = Platform.environment['GITHUB_HEAD_REF'];

  if (baseRef == null || headRef == null) {
    _logError(
        '✘ GITHUB_BASE_REF or GITHUB_HEAD_REF environment variables are not set.');
    exit(1);
  }

  // Fetch the list of added or modified Dart files in the PR
  final result = Process.runSync('git', [
    'diff',
    '--name-only',
    '--diff-filter=AMR',
    'origin/$baseRef...origin/$headRef'
  ]);

  // Split the output into a list of file paths
  final changedFiles = result.stdout.toString().split('\n');

  // Filter the list to include only Dart files in the 'lib' directory
  final dartFiles = changedFiles
      .where((file) => file.startsWith('lib/') && file.endsWith('.dart'))
      .toList();

  if (dartFiles.isEmpty) {
    _logSuccess(
        '✔ No Dart files in the lib directory are added or modified in the PR.');
    return;
  }

  bool hasErrors = false; // Track if any errors were found

  for (final file in dartFiles) {
    if (file.isEmpty) continue; // Skip empty lines in the list
    final lines = File(file).readAsLinesSync();

    // Check for class size and single responsibility violations
    if (_checkClassSize(file, lines) ||
        _checkSingleResponsibility(file, lines)) {
      hasErrors = true; // Set error flag if any check fails
    }
  }

  // Exit with an error code if any violations were found
  if (hasErrors) {
    _logError('✘ Code checks failed. Please address the warnings.');
    exit(1); // Non-zero exit code to indicate errors
  } else {
    _logSuccess('✔ All checks passed.');
  }
}

bool _checkClassSize(String path, List<String> lines) {
  int classLineCount = 0;
  int braceDepth = 0; // To track the depth of curly braces
  bool inClass = false;
  bool hasLargeClass =
      false; // Initialize to track if any class exceeds 300 lines

  for (final line in lines) {
    if (line.contains(RegExp(r'\bclass\b'))) {
      // Check for 'class' keyword (matches whole word only)
      inClass = true;
      classLineCount = 0; // Reset line count for new class
    }
    if (inClass) {
      classLineCount++;
      braceDepth += '{'.allMatches(line).length; // Increase brace depth
      braceDepth -= '}'.allMatches(line).length; // Decrease brace depth
      // Exit class scope if braceDepth returns to 0
      if (braceDepth == 0 && classLineCount > 0) {
        inClass = false;
        if (classLineCount > 300) {
          _logWarning('✘ Warning: Class in $path exceeds 300 lines.');
          hasLargeClass = true; // Set to true if any class exceeds the limit
        }
        classLineCount = 0; // Reset for next class
      }
    }
  }
  if (!hasLargeClass) {
    _logSuccess('✔ No large class found in $path.');
  }
  return hasLargeClass; // Return whether any class exceeded the line limit
}

bool _checkSingleResponsibility(String path, List<String> lines) {
  int methodCount = 0; // Counts the number of methods in the current class
  int braceDepth =
      0; // Tracks the depth of curly braces to identify the class scope
  bool inClass =
      false; // Indicates whether the parser is currently inside a class
  bool hasMultipleResponsibilities =
      false; // Flag to indicate if a class violates SRP

  for (final line in lines) {
    // Check for the 'class' keyword to identify the start of a class definition
    if (line.contains(RegExp(r'\bclass\b'))) {
      inClass = true; // We are inside a class now
      methodCount = 0; // Reset method count for the new class
      braceDepth = 0; // Reset brace depth for the new class
    }
    if (inClass) {
      braceDepth += '{'.allMatches(line).length; // Increase brace depth
      braceDepth -= '}'.allMatches(line).length; // Decrease brace depth
      // Check for methods using a regex to match typical Dart method signatures
      if (line.contains(RegExp(
          r'\b(?:void|int|double|String|bool|List|Map|Set|Future|Stream|[\w<>, ]+)\s+\w+\s*\('))) {
        methodCount++; // Increment the method count
      }
      // If braceDepth is zero, we've exited the current class scope
      if (braceDepth == 0 && inClass) {
        inClass = false; // We are no longer inside a class
        // Check if the method count exceeds the threshold for SRP
        if (methodCount > 10) {
          // Simple heuristic for SRP
          _logWarning(
              '✘ Warning: Class in $path might have multiple responsibilities.');
          hasMultipleResponsibilities =
              true; // Set flag indicating a potential SRP violation
        }
        methodCount = 0; // Reset method count for the next class
      }
    }
  }
  if (!hasMultipleResponsibilities) {
    _logSuccess('✔ No SRP violations found in $path.');
  }
  return hasMultipleResponsibilities; // Return true if any class violates SRP, otherwise false
}

void _logSuccess(String message) {
  stdout.writeln('\x1B[32m$message\x1B[0m'); // Green text
}

void _logWarning(String message) {
  stdout.writeln('\x1B[33m$message\x1B[0m'); // Yellow text
}

void _logError(String message) {
  stdout.writeln('\x1B[31m$message\x1B[0m'); // Red text
}
