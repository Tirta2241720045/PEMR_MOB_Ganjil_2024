import 'package:books_application/navigation_second.dart';
import 'package:flutter/material.dart';

class NavigationFirst extends StatefulWidget {
  const NavigationFirst({super.key});

  @override
  State<NavigationFirst> createState() => _NavigationFirstState();
}

class _NavigationFirstState extends State<NavigationFirst> {
  Color appBarColor = Colors.purple.shade700;
  Color bodyColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation First Screen - Rochmen'),
        backgroundColor: appBarColor,
        foregroundColor: Colors.white,
      ),
      body: Container(
        color: bodyColor,
        child: Center(
          child: ElevatedButton(
            child: const Text('Change Color'),
            onPressed: () {
              _navigateAndGetColor(context);
            },
          ),
        ),
      ),
    );
  }

  Future _navigateAndGetColor(BuildContext context) async {
    Color selectedColor = await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const NavigationSecond()),
        ) ??
        Colors.white;

    setState(() {
      bodyColor = selectedColor;
    });
  }
}
