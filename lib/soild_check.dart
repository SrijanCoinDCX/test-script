import 'dart:convert';
import 'dart:io';

// A class that violates SOLID principles
class UserManager {
  final String filePath;

  UserManager(this.filePath);

  // Single Responsibility Principle violation: Managing user data and file operations
  void addUser(String userName) {
    var users = _readUsers();
    users.add(userName);
    _writeUsers(users);
  }

  void removeUser(String userName) {
    var users = _readUsers();
    users.remove(userName);
    _writeUsers(users);
  }

  List<String> listUsers() {
    return _readUsers();
  }

  // Encapsulates file operations but it's mixed with user management
  List<String> _readUsers() {
    try {
      final file = File(filePath);
      if (!file.existsSync()) {
        return [];
      }
      final content = file.readAsStringSync();
      return LineSplitter.split(content).toList();
    } catch (e) {
      print('Error reading file: $e');
      return [];
    }
  }

  void _writeUsers(List<String> users) {
    try {
      final file = File(filePath);
      file.writeAsStringSync(users.join('\n'));
    } catch (e) {
      print('Error writing file: $e');
    }
  }
}
