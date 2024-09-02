// Abstractions
abstract class UserRepository {
  void saveUser(User user);
}

abstract class NotificationService {
  void sendNotification(String message);
}

// Concrete implementations
class DatabaseUserRepository implements UserRepository {
  @override
  void saveUser(User user) {
      print('Saving user ${user.userName} to the database.');
    // Implement actual database save logic
  }
}

class EmailNotificationService implements NotificationService {
  @override
  void sendNotification(String message) {
    print('Sending email notification: $message');
      // Implement actual email sending logic
  }
}

// User model class with single responsibility
class User {
  final String userName;
    final String email;

  User(this.userName, this.email);
}

// UserManager class that adheres to SOLID principles
class UserManager {
  final UserRepository userRepository;
  final NotificationService notificationService;

  UserManager(this.userRepository, this.notificationService);

  void registerUser(String userName, String email) {
    var user = User(userName, email);
    userRepository.saveUser(user);
      notificationService.sendNotification('Welcome $userName!');
  }

  void updateUserEmail(User user, String newEmail) {
    // Logic to update user email
    print('Updating email for user ${user.userName} to $newEmail');
    notificationService
        .sendNotification('Your email has been updated to $newEmail');
  }
}

void main() {
  // Dependency injection
  var userRepository = DatabaseUserRepository();
  var notificationService = EmailNotificationService();

  var userManager = UserManager(userRepository, notificationService);

  userManager.registerUser('john_doe', 'john@example.com');
  var user = User('john_doe', 'john@example.com');
  userManager.updateUserEmail(user, 'john.doe@example.com');
}

/*

Breakdown:

Single Responsibility Principle (SRP):

User class only holds user data.
UserRepository and NotificationService interfaces focus on specific responsibilities: data storage and notifications, respectively.
UserManager handles user registration and updates.

Open/Closed Principle (OCP):

UserManager can be extended with new functionalities by adding new methods, without modifying existing ones.
New implementations of UserRepository or NotificationService can be added without changing UserManager.

Liskov Substitution Principle (LSP):

DatabaseUserRepository and EmailNotificationService can be substituted for any other UserRepository or NotificationService implementations.

Interface Segregation Principle (ISP):

Interfaces UserRepository and NotificationService are focused and contain only the methods relevant to their specific responsibilities.

Dependency Inversion Principle (DIP):

UserManager depends on abstractions (UserRepository and NotificationService), not on concrete implementations.


*/
