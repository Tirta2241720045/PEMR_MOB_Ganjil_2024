import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final int rating; // Jumlah bintang aktif
  final int maxRating; // Jumlah total bintang
  final Color activeColor; // Warna bintang aktif
  final Color inactiveColor; // Warna bintang tidak aktif
  final double iconSize; // Ukuran icon

  const StarRating({
    super.key,
    this.rating = 3, // Default rating 3
    this.maxRating = 5, // Default max bintang 5
    this.activeColor = Colors.green, // Default warna aktif hijau
    this.inactiveColor = Colors.black, // Default warna non-aktif hitam
    this.iconSize = 24.0, // Default ukuran bintang 24
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(maxRating, (index) {
        return Icon(
          index < rating
              ? Icons.star
              : Icons.star_border, // Star penuh atau border
          color: index < rating ? activeColor : inactiveColor, // Warna bintang
          size: iconSize, // Ukuran bintang
        );
      }),
    );
  }
}
