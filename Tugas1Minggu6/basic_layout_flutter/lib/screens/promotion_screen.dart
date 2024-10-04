import 'package:basic_layout_flutter/screens/information_screen.dart';
import 'package:basic_layout_flutter/screens/profile_screen.dart';
import 'package:basic_layout_flutter/screens/view_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/star_rating.dart'; // Pastikan untuk mengimpor StarRating
import '../widgets/image_stack.dart'; // Pastikan untuk mengimpor ImageStack
import '../widgets/custom_list.dart'; // Pastikan untuk mengimpor CustomList
import '../widgets/image_grid.dart'; // Pastikan untuk mengimpor ImageGrid

class PromotionScreen extends StatelessWidget {
  const PromotionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Promotion'),
      ),
      body: Column(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween, // Space out the widgets
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              // Enable scrolling for smaller screens
              padding:
                  const EdgeInsets.all(16.0), // Add padding around the content
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 20),

                  // Custom list widget
                  const CustomList(),

                  const SizedBox(height: 20),

                  // Grid of images
                  const ImageGrid(),
                ],
              ),
            ),
          ),
          //terapkan bottom navigation bar
          BottomAppBar(
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
        ],
      ),
    );
  }
}
