import 'dart:io';

// Define basic patterns for potential SOLID principle violations
final Map<String, String> solidPatterns = {
  'Single Responsibility Principle':
      r'class\s+\w+\s*{.*(void\s+\w+\(.*\)\s*{){2,}', // Multiple methods in one class
  'Open/Closed Principle':
      r'class\s+\w+\s*{.*}', // Detect classes but only alerts for possible modifications
  'Liskov Substitution Principle':
      r'(extends|implements)\s+\w+', // Checks for inheritance
  'Interface Segregation Principle':
      r'class\s+\w+\s*implements\s+\w+', // Checks for multiple interface implementations
  'Dependency Inversion Principle':
      r'new\s+\w+\(', // Direct instantiation of objects
};

const int maxLinesPerClass = 300;

void main() {
  final dir = Directory.current;
  final dartFiles = dir.listSync(recursive: true).where((file) =>
      file.path.endsWith('.dart') &&
      !file.path.contains('/.dart_tool/') &&
      !file.path.contains('/test/'));

  print('Checking SOLID principles and class length in Dart files...');

  for (final file in dartFiles) {
    final content = File(file.path).readAsStringSync();
    
    // Check for SOLID principles violations
    for (final principle in solidPatterns.keys) {
      final pattern = RegExp(solidPatterns[principle]!);
      if (pattern.hasMatch(content)) {
        print('Potential $principle violation in ${file.path}');
      }
    }

    // Check for class length
    final classPattern = RegExp(r'class\s+\w+\s*{([^}]*)}', dotAll: true);
    final matches = classPattern.allMatches(content);
    
    for (final match in matches) {
      final classContent = match.group(1) ?? '';
      final lineCount = classContent.split('\n').length;
      if (lineCount > maxLinesPerClass) {
        print('Class in ${file.path} exceeds $maxLinesPerClass lines (actual: $lineCount lines)');
      }
    }
  }

  print('SOLID principles and class length check completed.');
}
