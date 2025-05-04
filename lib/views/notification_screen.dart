//
import 'package:flutter/material.dart';
import 'package:irrigiation_app/main.dart';
import 'package:irrigiation_app/models/notificationModel.dart'; // NotificationItem
import 'package:irrigiation_app/services/notification_service.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  // Use the global service so it's already running
  final NotificationService _notifService = notificationService;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: Colors.blue,
      ),
      body: StreamBuilder<List<NotificationItem>>(
        stream: _notifService.notificationsStream(),
        builder: (context, snapshot) {
          // 1) Still waiting for first batch?
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          // 2) Error from the API?
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Oops, there was an error.\nPlease try again later.',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            );
          }
          // 3) We got data (maybe empty)
          final notifications = snapshot.data;
          if (notifications == null) {
            // Shouldn't really happen, but just in case:
            return const Center(child: Text('No data.'));
          }
          if (notifications.isEmpty) {
            return const Center(child: Text('No notifications found.'));
          }

          // 4) Render the list
          return ListView.builder(
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              final n = notifications[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                color: Colors.white,
                child: ListTile(
                  leading: Icon(
                    n.irrigation
                        ? Icons.local_drink
                        : Icons.water_drop_outlined,
                    color: n.irrigation ? Colors.blue : Colors.grey,
                  ),
                  title: Text(
                    n.Mymessage,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Temp: ${n.temperature}°C, Soil: ${n.soilMoisture}%',
                      ),
                      Text(
                        'On ${n.date}',
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
