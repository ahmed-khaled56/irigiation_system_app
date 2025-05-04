import 'package:flutter/material.dart';
import 'package:irrigiation_app/views/notification_screen.dart';

import 'status_screen.dart'; // Import the status screen
import 'irrigation_screen.dart'; // Import the irrigation screen

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Irrigation System'),
      ),
      body: Stack(
        children: <Widget>[
          // Background image
          Positioned.fill(
            child: Image.asset(
              'lib/assets/images/irr.jpg',
              fit: BoxFit.fitHeight,
            ),
          ),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => StatusScreen()),
                    );
                  },
                  child: Text('Check Status screen'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => IrrigationScreen(),
                      ),
                    );
                  },
                  child: Text('Start Irrigation screen'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NotificationScreen(),
                      ),
                    );
                  },
                  child: Text('Display Notifications'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
