import 'package:flutter/widgets.dart';

class InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const InfoRow({required this.label, required this.value, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "$label: ",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        Text(value, style: const TextStyle(fontSize: 15)),
      ],
    );
  }
}
