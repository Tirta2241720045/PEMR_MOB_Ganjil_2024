import 'package:flutter/material.dart';

class TextSection extends StatelessWidget {
  final String description;

  const TextSection({Key? key, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        description,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
