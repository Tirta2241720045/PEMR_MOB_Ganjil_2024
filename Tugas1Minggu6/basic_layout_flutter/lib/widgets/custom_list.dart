import 'package:flutter/material.dart';

class CustomList extends StatelessWidget {
  const CustomList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 6,
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemBuilder: (BuildContext context, int index) {
        // List data (judul dan subtitle)
        final List<Map<String, dynamic>> listItems = [
          {
            'title': 'CineArts at the Empire',
            'subtitle': '85 W Portal Ave',
            'icon': Icons.theaters
          },
          {
            'title': 'The Castro Theater',
            'subtitle': '429 Castro St',
            'icon': Icons.theaters
          },
          {
            'title': 'Alamo Drafthouse Cinema',
            'subtitle': '2550 Mission St',
            'icon': Icons.theaters
          },
          {
            'title': 'Roxie Theater',
            'subtitle': '3117 16th St',
            'icon': Icons.theaters
          },
          {
            'title': 'K\'s Kitchen',
            'subtitle': '757 Monterey Blvd',
            'icon': Icons.restaurant
          },
          {
            'title': 'Emmy\'s Restaurant',
            'subtitle': '1923 Ocean Ave',
            'icon': Icons.restaurant
          },
        ];

        // Membuat setiap item list sebagai card
        return _buildTile(
          title: listItems[index]['title'],
          subtitle: listItems[index]['subtitle'],
          icon: listItems[index]['icon'],
          onTap: () {
            _showDetailDialog(context, listItems[index]['title'],
                listItems[index]['subtitle']);
          },
        );
      },
    );
  }

  // Tile sebagai Card dengan efek tap
  Widget _buildTile(
      {required String title,
      required String subtitle,
      required IconData icon,
      required Function onTap}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 4,
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
        subtitle: Text(subtitle),
        leading: Icon(
          icon,
          color: Colors.blue[500],
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => onTap(),
      ),
    );
  }

  // Fungsi untuk menampilkan dialog detail
  void _showDetailDialog(BuildContext context, String title, String subtitle) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text('Alamat: $subtitle'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
