import 'package:flutter/material.dart';

class ListDotWiwidget extends StatelessWidget {
  final String title;
  const ListDotWiwidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 6,
          height: 6,
          decoration: const BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle, // Circle shape
          ),
        ),
        const SizedBox(
          width: 7,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}
