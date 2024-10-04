import 'package:flutter/material.dart';
import 'information_screen.dart';
import 'profile_screen.dart';
import 'promotion_screen.dart';
import 'view_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Layout Demo'),
      ),
      body: Center(
        child: Text(
          'Welcome to the Flutter Layout Demo',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.info),
              tooltip: 'Go to Information',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const InformationScreen(),
                  ),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.person),
              tooltip: 'Go to Profile',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.local_offer),
              tooltip: 'Go to Promotion',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PromotionScreen(),
                  ),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.view_list),
              tooltip: 'Go to View Screen',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ViewScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
