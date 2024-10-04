import 'package:basic_layout_flutter/screens/profile_screen.dart';
import 'package:basic_layout_flutter/screens/promotion_screen.dart';
import 'package:basic_layout_flutter/screens/view_screen.dart';
import 'package:flutter/material.dart';
import 'image_section.dart'; // Import ImageSection
import 'title_section.dart'; // Import TitleSection
import 'text_section.dart'; // Import TextSection

class InformationScreen extends StatelessWidget {
  const InformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Information'),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const ImageSection(
                    image: 'lib/assets/images/pic6.jpg',
                  ),
                  const SizedBox(height: 20),
                  const TitleSection(
                    name: 'Politeknik Negeri Malang',
                    location:
                        'Jl. Soekarno Hatta No.9, Jatimulyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65141',
                  ),
                  const TextSection(
                    description:
                        'Politeknik Negeri Malang (Polinema) adalah lembaga pendidikan tinggi vokasi '
                        'yang terletak di Malang, Jawa Timur, Indonesia. Didirikan pada tahun 1978, '
                        'Polinema menawarkan program pendidikan yang berfokus pada pengembangan '
                        'keterampilan praktis dan profesional di berbagai bidang, termasuk teknologi, '
                        'manajemen, dan desain.',
                  ),
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
