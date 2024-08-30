import 'dart:io';

void main() {
  // Directory to start searching for Dart files
  final directory = Directory('lib');

  // Recursively list all Dart files in the 'lib' directory
  final dartFiles = directory
      .listSync(recursive: true)
      .where((entity) => entity.path.endsWith('.dart'))
      .toList();

  bool hasErrors = false; // Track if any errors were found

  for (final file in dartFiles) {
    final lines = File(file.path).readAsLinesSync();

    // Check for class size and single responsibility violations
    if (_checkClassSize(file.path, lines) || _checkSingleResponsibility(file.path, lines)) {
      hasErrors = true; // Set error flag if any check fails
    }
  }

  // Exit with an error code if any violations were found
  if (hasErrors) {
    print('Code checks failed. Please address the warnings.');
    exit(1);
  } else {
    print('All checks passed.');
  }
}

bool _checkClassSize(String path, List<String> lines) {
  int classLineCount = 0;
  bool inClass = false;
  bool hasViolation = false;

  for (final line in lines) {
    if (line.contains('class ')) {
      inClass = true;
    }

    if (inClass) {
      classLineCount++;
      if (line.contains('}')) {
        inClass = false;

        if (classLineCount > 300) {
          print('Error: Class in $path exceeds 300 lines.');
          hasViolation = true;
        }

        classLineCount = 0; // Reset for next class
      }
    }
  }

  return hasViolation;
}

bool _checkSingleResponsibility(String path, List<String> lines) {
  int methodCount = 0;
  bool inClass = false;
  bool hasViolation = false;

  for (final line in lines) {
    if (line.contains('class ')) {
      inClass = true;
    }

    if (inClass && line.contains('void ')) {
      methodCount++;
    }

    if (inClass && line.contains('}')) {
      inClass = false;

      if (methodCount > 10) { // Simple heuristic
        print('Error: Class in $path might have multiple responsibilities.');
        hasViolation = true;
      }

      methodCount = 0; // Reset for next class
    }
  }

  return hasViolation;
}
