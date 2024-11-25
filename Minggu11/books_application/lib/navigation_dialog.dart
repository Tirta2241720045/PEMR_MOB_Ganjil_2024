import 'package:flutter/material.dart';

class NavigationDialogScreen extends StatefulWidget {
  const NavigationDialogScreen({super.key});

  @override
  State<NavigationDialogScreen> createState() => _NavigationDialogScreenState();
}

class _NavigationDialogScreenState extends State<NavigationDialogScreen> {
  Color color =
      Colors.purple.shade700; // Set the initial background color to purple

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color, // Set the background color to purple
      appBar: AppBar(
        title: const Text(
          'Navigation Dialog Screen',
          style: TextStyle(color: Colors.white), // Change text color to white
        ),
        backgroundColor:
            Colors.purple.shade700, // Set the AppBar background color to purple
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Change Color'),
          onPressed: () async {
            // Call the _showColorDialog method when the button is pressed
            await _showColorDialog(context);
          },
        ),
      ),
    );
  }

  Future<void> _showColorDialog(BuildContext context) async {
    // Default color is the current color of the screen
    Color selectedColor = color;

    await showDialog(
      barrierDismissible:
          false, // Dialog must be dismissed by pressing a button
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Very important question'),
          content: const Text('Please choose a color'),
          actions: <Widget>[
            TextButton(
              child: const Text('Red'),
              onPressed: () {
                selectedColor = Colors.red.shade700;
                Navigator.pop(context,
                    selectedColor); // Close the dialog and return the selected color
              },
            ),
            TextButton(
              child: const Text('Green'),
              onPressed: () {
                selectedColor = Colors.green.shade700;
                Navigator.pop(context,
                    selectedColor); // Close the dialog and return the selected color
              },
            ),
            TextButton(
              child: const Text('Blue'),
              onPressed: () {
                selectedColor = Colors.blue.shade700;
                Navigator.pop(context,
                    selectedColor); // Close the dialog and return the selected color
              },
            ),
          ],
        );
      },
    );

    // After the dialog is closed, update the screen color
    setState(() {
      color = selectedColor;
    });
  }
}
