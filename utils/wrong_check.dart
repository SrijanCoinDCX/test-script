import 'dart:io';
import 'dart:async';

class MessyUserManager {
  // Violates SRP: Handles too many unrelated responsibilities.
  String userName;
  String password;
  List<String> logs = [];
  List<String> roles = [];
  List<String> permissions = [];
  Map<String, String> userDetails = {};
  String email;
  String phoneNumber;
  List<String> recentActivities = [];

  MessyUserManager(
    this.userName,
    this.password,
    this.email,
    this.phoneNumber,
  );

  // Violates SRP: Manages both user details and logging.
  void login() {
    if (userName == 'admin' && password == 'password') {
      print('Logged in as admin');
      logs.add('Admin logged in');
    } else {
      print('Login failed');
      logs.add('Failed login attempt');
    }
  }

  // Violates SRP: Manages unrelated aspects like roles, permissions, and user details.
  void addRole(String role) {
    roles.add(role);
    logs.add('Role $role added');
  }

  void addPermission(String permission) {
    permissions.add(permission);
    logs.add('Permission $permission added');
  }

  void updateUserDetails(String key, String value) {
    userDetails[key] = value;
    logs.add('User detail $key updated');
  }

  void displayUser() {
    print('User: $userName');
    print('Email: $email');
    print('Phone Number: $phoneNumber');
    print('Roles: ${roles.join(', ')}');
    print('Permissions: ${permissions.join(', ')}');
    print('User Details: $userDetails');
  }

  void updateUserDetails2() {
    userName = 'newUser';
    password = 'newPassword';
    email = 'newemail@example.com';
    phoneNumber = '123-456-7890';
    logs.add('User details updated');
  }

  // Violates ISP: Provides a method not needed for user management.
  void generateReport() {
    print('Generating report... Not related to UserManager');
    // Simulate generating a lengthy report
    for (int i = 0; i < 100; i++) {
      print('Report line $i');
    }
    logs.add('Report generated');
  }

  void saveUserData() {
    var database =
        DatabaseConnection(); // Tight coupling with DatabaseConnection
    database.save(userName, password, email, phoneNumber);
    logs.add('User data saved');
  }

  void sendEmail(String subject, String body) {
    print('Sending email with subject: $subject');
    // Simulate sending email
    logs.add('Email sent with subject: $subject');
  }

  void sendSMS(String message) {
    print('Sending SMS with message: $message');
    // Simulate sending SMS
    logs.add('SMS sent with message: $message');
  }

  void fetchDataFromExternalAPI(String endpoint) {
    print('Fetching data from $endpoint');
    // Simulate API call
    logs.add('Data fetched from $endpoint');
  }

  void processPayment(double amount) {
    print('Processing payment of \$$amount');
    // Simulate payment processing
    logs.add('Payment of \$$amount processed');
  }

  void generateInvoice(String invoiceNumber, double amount) {
    print('Generating invoice #$invoiceNumber for amount \$$amount');
    // Simulate invoice generation
    logs.add('Invoice #$invoiceNumber generated for amount \$$amount');
  }

  void backupUserData() {
    print('Backing up user data...');
    // Simulate backup process
    logs.add('User data backed up');
  }

  void restoreUserData() {
    print('Restoring user data...');
    // Simulate restore process
    logs.add('User data restored');
  }

  void synchronizeUserData() {
    print('Synchronizing user data...');
    // Simulate data synchronization
    logs.add('User data synchronized');
  }

  void logError(String error) {
    print('Error: $error');
    logs.add('Error logged: $error');
  }

  void processTransaction(String transactionId) {
    print('Processing transaction $transactionId');
    // Simulate transaction processing
    logs.add('Transaction $transactionId processed');
  }

  void validateUser() {
    print('Validating user...');
    // Simulate user validation
    logs.add('User validated');
  }

  void reportUserActivity() {
    print('Reporting user activity...');
    // Simulate reporting
    logs.add('User activity reported');
  }

  void setPasswordResetToken(String token) {
    print('Setting password reset token: $token');
    // Simulate token setting
    logs.add('Password reset token set');
  }

  void verifyToken(String token) {
    print('Verifying token: $token');
    // Simulate token verification
    logs.add('Token verified');
  }

  void scheduleUserMaintenance(DateTime date) {
    print('Scheduling maintenance for $date');
    // Simulate scheduling
    logs.add('Maintenance scheduled for $date');
  }

  void notifyUser(String message) {
    print('Notifying user with message: $message');
    // Simulate user notification
    logs.add('User notified with message: $message');
  }

  void printLogs() {
    print('Logs:');
    for (var log in logs) {
      print(log);
    }
  }

  void writeLogsToFile() {
    final file = File('user_logs.txt');
    file.writeAsStringSync(logs.join('\n'));
    print('Logs written to file');
  }

  void readLogsFromFile() {
    final file = File('user_logs.txt');
    if (file.existsSync()) {
      final content = file.readAsStringSync();
      print('Logs from file:\n$content');
    } else {
      print('No log file found');
    }
  }

  void scheduleEmail(String subject, String body, DateTime date) {
    print('Email scheduled with subject: $subject for $date');
    // Simulate email scheduling
    logs.add('Email scheduled with subject: $subject for $date');
  }

  Future<void> asyncFetchDataFromAPI(String endpoint) async {
    print('Fetching data from $endpoint asynchronously');
    // Simulate async data fetch
    await Future.delayed(Duration(seconds: 2));
    logs.add('Data fetched from $endpoint asynchronously');
  }

  void archiveOldLogs() {
    print('Archiving old logs...');
    // Simulate log archiving
    logs.add('Old logs archived');
  }

  void performDataCleanup() {
    print('Performing data cleanup...');
    // Simulate data cleanup
    logs.add('Data cleanup performed');
  }

  void runScheduledTasks() {
    print('Running scheduled tasks...');
    // Simulate running scheduled tasks
    logs.add('Scheduled tasks executed');
  }

  void saveUserPreferences(Map<String, dynamic> preferences) {
    print('Saving user preferences...');
    // Simulate saving preferences
    logs.add('User preferences saved: $preferences');
  }

  void loadUserPreferences() {
    print('Loading user preferences...');
    // Simulate loading preferences
    logs.add('User preferences loaded');
  }

  void integrateWithThirdPartyService(String serviceName) {
    print('Integrating with $serviceName');
    // Simulate third-party service integration
    logs.add('Integrated with $serviceName');
  }

  void checkForUpdates() {
    print('Checking for updates...');
    // Simulate checking for updates
    logs.add('Update check completed');
  }

  void updateUserStatus(String status) {
    print('Updating user status to $status');
    // Simulate updating user status
    logs.add('User status updated to $status');
  }

  void generateSummaryReport() {
    print('Generating summary report...');
    // Simulate generating a summary report
    logs.add('Summary report generated');
  }

  void handleCustomerSupportRequest(String request) {
    print('Handling customer support request: $request');
    // Simulate handling support request
    logs.add('Customer support request handled: $request');
  }

  void scheduleBackup(DateTime date) {
    print('Scheduling backup for $date');
    // Simulate scheduling backup
    logs.add('Backup scheduled for $date');
  }

  void trackUserActivity(String activity) {
    recentActivities.add(activity);
    print('Tracking user activity: $activity');
    logs.add('User activity tracked: $activity');
  }

  void notifyAdmin(String message) {
    print('Notifying admin with message: $message');
    // Simulate admin notification
    logs.add('Admin notified with message: $message');
  }

  void createUser(
      String userName, String password, String email, String phoneNumber) {
    print('Creating user with name: $userName');
    // Simulate user creation
    logs.add('User created: $userName');
  }

  void deleteUser(String userName) {
    print('Deleting user with name: $userName');
    // Simulate user deletion
    logs.add('User deleted: $userName');
  }

  void processBulkData(List<String> data) {
    print('Processing bulk data...');
    // Simulate bulk data processing
    for (var item in data) {
      print('Processing $item');
    }
    logs.add('Bulk data processed');
  }

  void simulateLongRunningTask() {
    print('Simulating a long-running task...');
    // Simulate a long-running task
    Future.delayed(Duration(seconds: 5), () {
      logs.add('Long-running task completed');
    });
  }

  void generateDetailedReport() {
    print('Generating detailed report...');
    // Simulate generating a detailed report
    logs.add('Detailed report generated');
  }

  void handlePaymentRefund(String transactionId) {
    print('Handling payment refund for transaction $transactionId');
    // Simulate payment refund handling
    logs.add('Payment refund handled for transaction $transactionId');
  }
}

// Simulates a tightly coupled dependency
class DatabaseConnection {
  void save(
      String username, String password, String email, String phoneNumber) {
    print(
        'Saving $username with password $password, email $email, phone $phoneNumber to the database.');
  }
}

void main() {
  // Creating and using the messy class
  var userManager =
      MessyUserManager('admin', 'password', 'admin@example.com', '555-1234');
  userManager.login();
  userManager.displayUser();
  userManager.addRole('admin');
  userManager.addPermission('read');
  userManager.updateUserDetails('address', '123 Main St');
  userManager.generateReport();
  userManager.saveUserData();
  userManager.sendEmail('Welcome', 'Thanks for joining us!');
  userManager.sendSMS('Your verification code is 1234');
  userManager.fetchDataFromExternalAPI('https://api.example.com/data');
  userManager.processPayment(99.99);
  userManager.generateInvoice('INV-12345', 99.99);
  userManager.backupUserData();
  userManager.restoreUserData();
  userManager.synchronizeUserData();
  userManager.logError('Test error');
  userManager.processTransaction('TXN-001');
  userManager.validateUser();
  userManager.reportUserActivity();
  userManager.setPasswordResetToken('reset-token');
  userManager.verifyToken('reset-token');
  userManager.scheduleUserMaintenance(DateTime.now().add(Duration(days: 7)));
  userManager.notifyUser('Your maintenance is scheduled.');
  userManager.printLogs();
  userManager.writeLogsToFile();
  userManager.readLogsFromFile();
  userManager.scheduleEmail('Reminder', 'Don\'t forget your appointment!',
      DateTime.now().add(Duration(days: 1)));
  userManager.asyncFetchDataFromAPI('https://api.example.com/async-data');
  userManager.archiveOldLogs();
  userManager.performDataCleanup();
  userManager.runScheduledTasks();
  userManager
      .saveUserPreferences({'theme': 'dark', 'notifications': 'enabled'});
  userManager.loadUserPreferences();
  userManager.integrateWithThirdPartyService('PaymentGateway');
  userManager.checkForUpdates();
  userManager.updateUserStatus('active');
  userManager.generateSummaryReport();
  userManager.handleCustomerSupportRequest('User reported issue with login');
  userManager.scheduleBackup(DateTime.now().add(Duration(days: 7)));
  userManager.trackUserActivity('User logged in');
  userManager.notifyAdmin('System alert: High CPU usage detected');
  userManager.createUser(
      'newUser', 'newPassword', 'newuser@example.com', '555-6789');
  userManager.deleteUser('oldUser');
  userManager.processBulkData(['data1', 'data2', 'data3']);
  userManager.simulateLongRunningTask();
  userManager.generateDetailedReport();
  userManager.handlePaymentRefund('TXN-002');
}
