class Item {
  String name;
  int price;
  String imageUrl; // URL untuk foto produk
  int stock; // Stok produk
  double rating; // Rating produk

  Item({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.stock,
    required this.rating,
  });
}
