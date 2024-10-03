import 'package:flutter/material.dart';

class CustomToolTip extends StatelessWidget {
  final String title;
  final Widget icon;
  const CustomToolTip({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: title,
      decoration: BoxDecoration(color: Colors.blue.shade900),
      child: Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(color: Colors.blue.shade900, shape: BoxShape.circle),
        child: IconButton(
          icon: icon,
          onPressed: () {
            // Action for home icon
          },
        ),
      ),
    );
  }
}
