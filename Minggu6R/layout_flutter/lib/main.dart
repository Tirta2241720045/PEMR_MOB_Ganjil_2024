import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Title section with necessary changes
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Wisata Gunung di Batu',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Text(
                  'Batu, Malang, Indonesia',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.star,
            color: Colors.red,
          ),
          const Text('41'),
        ],
      ),
    );

    // Define primary color from theme
    Color color = Theme.of(context).primaryColor;

    // Button section with three buttons (call, route, share)
    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    // Image section
    // Widget imageSection = Container(
    //   child: Image.asset(
    //     'lib/images/lake.jpg',
    //     width: double.infinity, // Set the width to infinity to take full width
    //     height: 240, // Keep the height fixed
    //     fit: BoxFit.cover, // Make the image cover the entire container
    //   ),
    // );

    // Text section
    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch, // Make text full-width
        children: [
          Text(
            'Gunung Batu di Malang adalah salah satu destinasi wisata alam '
            'terbaik di Jawa Timur. Dikenal dengan pemandangan alam yang indah '
            'dan suasana sejuk, tempat ini menawarkan trekking, camping, dan '
            'spot foto yang menarik bagi wisatawan. Lokasinya berada di Batu, '
            'dekat dengan kota Malang.\n\n'
            'Identitas:\n'
            'Nama: Tirta Nurrochman Bintang Prawira\n'
            'NIM: 2241720045\n\n',
            textAlign: TextAlign.justify, // Justify main text
            softWrap: true,
          ),
          Text(
            'Selamat menikmati pemandangan dan suasana pegunungan 🙂.',
            textAlign: TextAlign.center, // Center this text
            softWrap: true,
          ),
        ],
      ),
    );

    return MaterialApp(
      title: 'Flutter layout: Tirta Nurrochman Bintang Prawira 2241720045',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo'),
        ),
        body: ListView(
          children: [
            Image.asset('lib/images/lake.jpg',
                width: 600,
                height: 240,
                fit: BoxFit.cover), // Praktikum 4: Implementasi image section
            titleSection, // Praktikum 1: Membangun Layout di Flutter
            buttonSection, // Praktikum 2: Implementasi button row
            textSection, // Praktikum 3: Implementasi text section
          ],
        ),
      ),
    );
  }

  // Helper method to build the button column
  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8), // Add margin only on top
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
