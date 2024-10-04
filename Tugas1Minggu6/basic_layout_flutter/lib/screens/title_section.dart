import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {
  final String name;
  final String location;

  const TitleSection({Key? key, required this.name, required this.location})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          location,
          style: TextStyle(color: Colors.grey[600]),
        ),
      ],
    );
  }
}
