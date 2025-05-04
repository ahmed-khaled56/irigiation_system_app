// import 'dart:async';

// import 'package:intl/intl.dart';
// import 'package:irrigiation_app/models/notificationModel.dart';

// class NotificationService {
//   final StreamController<List<NotificationModel>> _controller =
//       StreamController<List<NotificationModel>>.broadcast();

//   NotificationService() {
//     _fetchNotificationsPeriodically();
//   }

//   // Expose the notification stream
//   Stream<List<NotificationModel>> notificationsStream() {
//     return _controller.stream;
//   }

//   // Simulate fetching notifications periodically
//   void _fetchNotificationsPeriodically() async {
//     while (true) {
//       List<NotificationModel> notifications = await fetchNotifications();
//       _controller.add(notifications);
//       await Future.delayed(Duration(seconds: 10)); // Fetch every 10 seconds
//     }
//   }

//   String formatedDte = DateFormat('dd-MM-yyyy').format(DateTime.now());
//   // Simulate an API call to fetch notifications
//   Future<List<NotificationModel>> fetchNotifications() async {
//     await Future.delayed(Duration(seconds: 2)); // Simulate network delay
//     return [
//       NotificationModel(
//         id: 1,
//         title: "New Feature Released",
//         body: "Check out our latest update!",
//         date: formatedDte,
//         isRead: false,
//       ),
//       NotificationModel(
//         id: 2,
//         title: "Meeting Reminder",
//         body: "Your meeting is scheduled at 3:00 PM.",
//         date: formatedDte,
//         isRead: true,
//       ),
//     ];
//   }
// }
import 'dart:async';
import 'package:irrigiation_app/helpers/API.dart';
import 'package:irrigiation_app/models/notificationModel.dart'; // NotificationItem & NotificationsResponse

class NotificationService {
  // You can inject a custom API client if you like (e.g. for testing)
  final API _apiClient;

  NotificationService({API? apiClient}) : _apiClient = apiClient ?? API() {
    _fetchNotificationsPeriodically();
  }

  // Broadcast stream so multiple listeners can subscribe
  final StreamController<List<NotificationItem>> _controller =
      StreamController<List<NotificationItem>>.broadcast();

  /// Expose the stream of notifications
  Stream<List<NotificationItem>> notificationsStream() => _controller.stream;

  /// Poll the API every 10 seconds
  void _fetchNotificationsPeriodically() async {
    while (true) {
      try {
        final notifications = await fetchNotifications();
        _controller.add(notifications);
      } catch (error) {
        _controller.addError(error);
      }
      await Future.delayed(const Duration(seconds: 10));
    }
  }

  /// Calls your API helper’s GET method on the notifications endpoint,
  /// parses the JSON and returns the list of NotificationItem.
  Future<List<NotificationItem>> fetchNotifications() async {
    // 1) Call your API.get, passing the notifications URL
    final responseJson = await _apiClient.get(
      url: 'https://88bb-196-128-10-0.ngrok-free.app/api/notifications',
    );

    // 2) Decode into our wrapper model
    final notificationsResponse = NotificationsResponse.fromJson(responseJson);

    // 3) Return the inner list of NotificationItem
    return notificationsResponse.data;
  }
}
