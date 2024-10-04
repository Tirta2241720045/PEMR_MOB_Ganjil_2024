import 'package:flutter/material.dart';

class ImageSection extends StatelessWidget {
  final String image;

  const ImageSection({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      fit: BoxFit.cover,
      width: double.infinity,
      height: 200,
    );
  }
}
