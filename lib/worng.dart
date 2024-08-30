class MessyUserManager {
  // Violates SRP: Handles too many unrelated responsibilities.
  String userName;
  String password;
  List<String> logs = [];

  MessyUserManager(this.userName, this.password);

  // Violates SRP: Manages both user details and logging.
  void login() {
    // Business logic mixed with low-level implementation details
    if (userName == 'admin' && password == 'password') {
      print('Logged in as admin');
      logs.add('Admin logged in');
    } else {
      print('Login failed');
      logs.add('Failed login attempt');
    }
  }

  // Violates OCP: Modifications required for every new requirement.
  void displayUser() {
    print('User: $userName');
  }

  // Violates LSP: Does not work well with base classes (none used here).
  // Pretend this method would not respect a parent class behavior.
  void updateUserDetails() {
    // Inconsistent behavior
    userName = 'newUser';
    password = 'newPassword';
    print('User details updated');
  }

  // Violates ISP: Forces classes to use unnecessary methods.
  void generateReport() {
    // Some unrelated functionality
    print('Generating report... Not related to UserManager');
  }

  // Violates DIP: Directly instantiates dependencies instead of using abstractions.
  void saveUserData() {
    var database = DatabaseConnection(); // Tight coupling with DatabaseConnection
    database.save(userName, password);
    print('User data saved');
  }
}

// Simulates a tightly coupled dependency
class DatabaseConnection {
  void save(String username, String password) {
    print('Saving $username with password $password to the database.');
  }
}

void main() {
  // Creating and using the messy class
  var userManager = MessyUserManager('admin', 'password');
  userManager.login();
  userManager.displayUser();
  userManager.updateUserDetails();
  userManager.generateReport();
  userManager.saveUserData();
}
