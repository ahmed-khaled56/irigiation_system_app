import 'package:flutter/material.dart';
import 'package:irrigiation_app/services/notification_service.dart';
import 'package:irrigiation_app/views/home.dart';

final NotificationService notificationService = NotificationService();
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // late NotificationService _notificationService;
  // String _notificationMessage = '';

  // @override
  // void initState() {
  //   super.initState();
  //   _notificationService = NotificationService(
  //       'wss://your-ngrok-url'); // استبدل بعنوان ngrok الخاص بك
  //   _notificationService.listenForNotifications((message) {
  //     setState(() {
  //       _notificationMessage = message;
  //     });
  //   });
  // }

  // @override
  // void dispose() {
  //   _notificationService.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agricultural Land Management',
      theme: ThemeData(primarySwatch: Colors.green),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      // Set HomeScreen as the initial view
    );
  }
}
