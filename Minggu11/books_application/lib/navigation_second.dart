import 'package:flutter/material.dart';

class NavigationSecond extends StatefulWidget {
  const NavigationSecond({super.key});

  @override
  State<NavigationSecond> createState() => _NavigationSecondState();
}

class _NavigationSecondState extends State<NavigationSecond> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Second Screen'),
        backgroundColor: Colors.purple.shade700,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              child: const Text('Pink'),
              onPressed: () {
                Navigator.pop(context, Colors.pink.shade700);
              },
            ),
            ElevatedButton(
              child: const Text('Yellow'),
              onPressed: () {
                Navigator.pop(context, Colors.yellow.shade700);
              },
            ),
            ElevatedButton(
              child: const Text('Purple'),
              onPressed: () {
                Navigator.pop(context, Colors.purple.shade700);
              },
            ),
          ],
        ),
      ),
    );
  }
}
