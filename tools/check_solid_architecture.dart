import 'dart:io';
void main() {
  // Directory to start searching for Dart files
  final directory = Directory('lib');
  // Recursively list all Dart files in the 'lib' directory
  final dartFiles = directory
      .listSync(recursive: true)
      .where((entity) => entity.path.endsWith('.dart'))
      .toList();
  for (final file in dartFiles) {
    final lines = File(file.path).readAsLinesSync();
    // Example check: Class should not have more than 300 lines of code
    _checkClassSize(file.path, lines);
    // Example check: Class should have only one responsibility (simple heuristic)
    _checkSingleResponsibility(file.path, lines);
  }
}
void _checkClassSize(String path, List<String> lines) {
  int classLineCount = 0;
  bool inClass = false;
  for (final line in lines) {
    if (line.contains('class ')) {
      inClass = true;
    }
    if (inClass) {
      classLineCount++;
      if (line.contains('}')) {
        inClass = false;
        if (classLineCount > 300) {
          print('Warning: Class in $path exceeds 300 lines.');
        }
        classLineCount = 0; // Reset for next class
      }
    }
  }
}
void _checkSingleResponsibility(String path, List<String> lines) {
  int methodCount = 0;
  bool inClass = false;
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
        print('Warning: Class in $path might have multiple responsibilities.');
      }
      methodCount = 0; // Reset for next class
    }
  }
}






