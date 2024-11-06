import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart'; // Pastikan untuk menambahkan package ini di pubspec.yaml
import 'dart:io';

class GalleryPage extends StatefulWidget {
  const GalleryPage({Key? key}) : super(key: key);

  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  bool _isGalleryOpen = false; // Untuk mengontrol status galeri
  List<String> _folders = []; // Daftar folder
  List<String> _folderContents = []; // Menyimpan isi folder saat ini

  @override
  void initState() {
    super.initState();
    _requestPermission(); // Minta izin saat halaman dibuka
  }

  Future<void> _requestPermission() async {
    final status = await Permission.storage.request(); // Meminta izin
    if (status.isGranted) {
      setState(() {
        _isGalleryOpen = true; // Ubah status galeri menjadi terbuka
      });
      _loadFolders(); // Muat folder setelah izin diberikan
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Izin akses ditolak')),
      );
    }
  }

  Future<void> _loadFolders() async {
    try {
      final Directory rootDir =
          Directory('/storage/emulated/0'); // Akses penyimpanan internal
      List<String> folders = [];

      // Dapatkan semua folder di direktori root
      var dirList = rootDir.listSync();
      for (var entity in dirList) {
        if (entity is Directory) {
          folders.add(entity.path.split('/').last); // Ambil nama folder
        }
      }

      setState(() {
        _folders = folders; // Simpan daftar folder
      });
    } catch (e) {
      print("Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Gagal memuat folder')),
      );
    }
  }

  Future<void> _loadFolderContents(String folderName) async {
    try {
      final Directory folder =
          Directory('/storage/emulated/0/$folderName'); // Akses folder
      List<String> contents = [];

      // Cek apakah folder ada
      if (await folder.exists()) {
        var fileList = folder.listSync();
        for (var entity in fileList) {
          if (entity is File) {
            contents.add(entity.path.split('/').last); // Ambil nama file
          }
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Folder tidak ditemukan')),
        );
      }

      // Menyimpan isi folder dalam list
      setState(() {
        _folderContents = contents; // Simpan isi folder
      });
    } catch (e) {
      print("Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Gagal memuat isi folder')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Berpindah ke halaman Galeri',
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 20), // Jarak antara teks dan daftar folder
          if (_isGalleryOpen) ...[
            const Text('Daftar Folder:', style: TextStyle(fontSize: 18)),
            Expanded(
              // Tambahkan Expanded untuk menampung daftar folder
              child: ListView.builder(
                itemCount: _folders.length,
                itemBuilder: (context, index) {
                  final folderName = _folders[index];
                  return ListTile(
                    title: Text(folderName),
                    leading: const Icon(Icons.folder), // Ikon folder
                    onTap: () async {
                      // Memuat isi folder saat diklik
                      await _loadFolderContents(folderName);
                      _showFolderContentsDialog(
                          folderName); // Tampilkan dialog dengan isi folder
                    },
                  );
                },
              ),
            ),
          ] else ...[
            const Text('Menunggu izin akses ke galeri...',
                style: TextStyle(fontSize: 18)),
          ],
        ],
      ),
    );
  }

  void _showFolderContentsDialog(String folderName) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Isi dari $folderName'),
        content: _folderContents.isNotEmpty
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: _folderContents.map((file) => Text(file)).toList(),
              )
            : const Text('Folder kosong atau tidak ditemukan.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Tutup'),
          ),
        ],
      ),
    );
  }
}
