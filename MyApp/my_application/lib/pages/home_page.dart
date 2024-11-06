import 'package:flutter/material.dart';
import 'camera_page.dart'; // Import halaman kamera
import 'gallery_page.dart'; // Import halaman galeri

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedPage = 0; // 0 untuk Home, 1 untuk Kamera, 2 untuk Galeri

  // Fungsi untuk mengubah halaman berdasarkan indeks yang dipilih
  void _onPageSelected(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  // Fungsi untuk menentukan widget yang ditampilkan berdasarkan halaman yang dipilih
  Widget _buildBody() {
    switch (_selectedPage) {
      case 1:
        return const CameraPage(); // Halaman Kamera
      case 2:
        return const GalleryPage(); // Halaman Galeri
      case 0:
      default:
        return _buildHomePage(); // Menampilkan halaman Home
    }
  }

  // Konten placeholder untuk halaman Home
  Widget _buildHomePage() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Selamat Datang di Aplikasi Saya!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Image.network(
            'https://example.com/path-to-your-image.jpg', // URL gambar di internet
            width: 150,
            height: 150,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              } else {
                return const CircularProgressIndicator();
              }
            },
            errorBuilder: (context, error, stackTrace) {
              return const Text('Gagal Memuat Gambar');
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Aksi untuk tombol tambahan (misalnya navigasi ke fitur tertentu)
            },
            child: const Text('Mulai Eksplorasi'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: _buildBody(), // Menampilkan halaman berdasarkan _selectedPage
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.camera_alt),
              onPressed: () {
                _onPageSelected(1); // Berpindah ke halaman Kamera
              },
            ),
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                _onPageSelected(0); // Berpindah ke halaman Home
              },
            ),
            IconButton(
              icon: const Icon(Icons.photo),
              onPressed: () {
                _onPageSelected(2); // Berpindah ke halaman Galeri
              },
            ),
          ],
        ),
      ),
    );
  }
}
