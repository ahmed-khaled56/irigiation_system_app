import 'package:flutter/material.dart';

class NoStatusBody extends StatelessWidget {
  NoStatusBody({super.key, required this.isPressed});
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            isPressed == true
                ? Text(
                  'No existed data from API 😔 ',
                  style: TextStyle(fontSize: 30),
                )
                : Text(
                  'start checking now  🔍',
                  style: TextStyle(fontSize: 30),
                ),
          ],
        ),
      ),
    );
  }
}
