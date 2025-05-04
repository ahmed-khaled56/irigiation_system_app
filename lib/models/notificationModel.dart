// class NotificationModel {
//   final int id; // Unique identifier for the notification
//   final String title; // Title of the notification
//   final String body; // Body text of the notification
//   final String date; // Date and time when the notification was created
//   final bool isRead;

//   NotificationModel({
//     required this.id,
//     required this.date,
//     required this.isRead,
//     required this.title,
//     required this.body,
//   });

//   // Factory constructor to create an instance from a JSON object
//   factory NotificationModel.fromJson(Map<String, dynamic> json) {
//     return NotificationModel(
//       id: json['id'],
//       title: json['title'],
//       body: json['message'],
//       date: json['date'], // Parse date string to DateTime
//       isRead: json['isRead'] ?? false,
//     );
//   }

//   // Convert the object to a JSON format
//   // Map<String, dynamic> toJson() {
//   //   return {
//   //     'title': title,
//   //     'body': body,

//   //   };
//   // }
// }

// 1. الموديل للعنصر الفردي
class NotificationItem {
  final String soilMoisture;
  final String soilTemperature;
  final bool irrigation;
  final String temperature;
  final String Mymessage;
  final String date;

  NotificationItem({
    required this.soilMoisture,
    required this.soilTemperature,
    required this.irrigation,
    required this.temperature,
    required this.Mymessage,
    required this.date,
  });

  factory NotificationItem.fromJson(Map<String, dynamic> json) {
    return NotificationItem(
      soilMoisture: json['soil_moisture'],
      soilTemperature: json['soil_temperature'],
      irrigation: json['irrigation'],
      temperature: json['temperature'],
      Mymessage: json['message'],
      date: json['date'],
    );
  }
}

// 2. الموديل للـ API Response كامل
class NotificationsResponse {
  final int code;
  final String message;
  final List<dynamic> errors;
  final List<NotificationItem> data;

  NotificationsResponse({
    required this.code,
    required this.message,
    required this.errors,
    required this.data,
  });

  factory NotificationsResponse.fromJson(Map<String, dynamic> json) {
    return NotificationsResponse(
      code: json['code'],
      message: json['message'],
      errors: json['errors'] ?? [],
      data:
          (json['data'] as List)
              .map((item) => NotificationItem.fromJson(item))
              .toList(),
    );
  }
}
