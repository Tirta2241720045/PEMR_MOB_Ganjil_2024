import 'package:flutter/material.dart';

class ImageGrid extends StatelessWidget {
  final int imageCount; // Jumlah gambar
  final String assetFolder; // Folder gambar
  final double maxCrossAxisExtent;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final double padding;

  const ImageGrid({
    super.key,
    this.imageCount = 6, // Default 6 gambar
    this.assetFolder = 'lib/assets/images', // Default folder
    this.maxCrossAxisExtent = 150, // Ukuran default grid
    this.mainAxisSpacing = 4,
    this.crossAxisSpacing = 4,
    this.padding = 4,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      shrinkWrap: true,
      maxCrossAxisExtent: maxCrossAxisExtent, // Fleksibel max lebar tiap kolom
      padding: EdgeInsets.all(padding),
      mainAxisSpacing: mainAxisSpacing,
      crossAxisSpacing: crossAxisSpacing,
      children: _buildGridTileList(imageCount), // Jumlah gambar dinamis
    );
  }

  List<Container> _buildGridTileList(int count) {
    return List.generate(count, (i) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey),
        ),
        child: GestureDetector(
          onTap: () {
            print('Gambar $i di-tap!');
          },
          child: Image.asset(
            '$assetFolder/pic$i.jpg',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return const Center(
                child: Icon(Icons.error, color: Colors.red),
              ); // Fallback icon jika gambar tidak ditemukan
            },
          ),
        ),
      );
    });
  }
}
