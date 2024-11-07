import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image_picker/image_picker.dart'; // Untuk memilih gambar dari galeri
import 'package:flutter/services.dart'; // Untuk menambahkan platform channel jika perlu
import 'filter_selector.dart';
import 'dart:html' as html; // Untuk platform Web

class PhotoFilterCarousel extends StatefulWidget {
  const PhotoFilterCarousel({super.key});

  @override
  State<PhotoFilterCarousel> createState() => _PhotoFilterCarouselState();
}

class _PhotoFilterCarouselState extends State<PhotoFilterCarousel> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  File? _image;
  final _filters = [
    Colors.white,
    ...List.generate(
      Colors.primaries.length,
      (index) => Colors.primaries[(index * 4) % Colors.primaries.length],
    )
  ];
  final _filterColor = ValueNotifier<Color>(Colors.white);
  Uint8List? _imageBytes; // Untuk menyimpan gambar dalam bentuk byte array

  GlobalKey _repaintKey = GlobalKey(); // Key untuk RepaintBoundary

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  // Fungsi untuk menginisialisasi kamera
  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    _controller = CameraController(firstCamera, ResolutionPreset.high);
    _initializeControllerFuture = _controller.initialize();
    setState(() {}); // Memperbarui status UI setelah inisialisasi selesai
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onFilterChanged(Color value) {
    _filterColor.value = value;
  }

  Future<void> _takePicture() async {
    try {
      await _initializeControllerFuture; // Pastikan kamera siap

      // Ambil gambar
      final image = await _controller.takePicture();

      setState(() {
        _image = File(image.path);
      });

      // Untuk Web: Mengonversi gambar ke byte array
      if (kIsWeb) {
        final imageBytes = await image.readAsBytes();
        setState(() {
          _imageBytes = imageBytes;
        });
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  // Fungsi untuk menyimpan screenshot gambar tanpa UI
  Future<void> _saveImage() async {
    if (_image == null && _imageBytes == null) {
      return;
    }

    // Ambil screenshot dari tampilan tanpa UI
    try {
      RenderRepaintBoundary boundary = _repaintKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      final image = await boundary.toImage(pixelRatio: 3.0); // Ambil gambar

      // Ubah gambar menjadi byte array
      final byteData = await image.toByteData(format: ImageByteFormat.png);
      final buffer = byteData!.buffer.asUint8List();

      if (kIsWeb) {
        // Untuk Web, unduh gambar sebagai file
        final blob = html.Blob([Uint8List.fromList(buffer)]);
        final url = html.Url.createObjectUrlFromBlob(blob);
        final anchor = html.AnchorElement(href: url)
          ..target = 'blank'
          ..download = 'filtered_image.png'; // Nama file gambar yang diunduh
        anchor.click();
        html.Url.revokeObjectUrl(url);
      } else {
        // Untuk Android/iOS: Simpan gambar ke penyimpanan lokal
        final directory = await getApplicationDocumentsDirectory();
        final imagePath = '${directory.path}/filtered_image.png';
        final imageFile = File(imagePath);

        // Menyimpan gambar
        await imageFile.writeAsBytes(buffer);

        // Tampilkan snackbar atau dialog untuk konfirmasi
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gambar berhasil disimpan di $imagePath')),
        );
      }
    } catch (e) {
      print('Error saving image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: Stack(
        children: [
          Positioned.fill(
            child: _buildPhotoWithFilter(),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: _buildFilterSelector(),
          ),
          Positioned(
            top: 50,
            right: 16,
            child: FloatingActionButton(
              onPressed: _takePicture,
              tooltip: 'Ambil Foto',
              child: const Icon(Icons.camera_alt),
            ),
          ),
          Positioned(
            top: 50,
            left: 16,
            child: FloatingActionButton(
              onPressed: _saveImage,
              tooltip: 'Simpan Foto',
              child: const Icon(Icons.save_alt),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhotoWithFilter() {
    return RepaintBoundary(
      key: _repaintKey, // Tandai widget yang ingin di-screenshot
      child: ValueListenableBuilder(
        valueListenable: _filterColor,
        builder: (context, color, child) {
          // Menampilkan pratinjau kamera saat belum ada gambar
          if (_image == null) {
            return FutureBuilder<void>(
              future: _initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                      child:
                          CircularProgressIndicator()); // Menunggu inisialisasi
                }

                if (snapshot.hasError) {
                  return Center(
                      child: Text('Terjadi kesalahan: ${snapshot.error}'));
                }

                // Jika kamera sudah siap, tampilkan pratinjau kamera
                return CameraPreview(_controller);
              },
            );
          }

          // Jika gambar sudah diambil, tampilkan gambar dengan filter
          return ColorFiltered(
            colorFilter: ColorFilter.mode(
              color.withOpacity(0.5),
              BlendMode.color,
            ),
            child: kIsWeb
                ? _imageBytes != null
                    ? Image.memory(
                        _imageBytes!,
                        fit: BoxFit.cover,
                      )
                    : const Center(child: Text("Gambar tidak ditemukan"))
                : Image.file(
                    _image!,
                    fit: BoxFit.cover,
                  ),
          );
        },
      ),
    );
  }

  Widget _buildFilterSelector() {
    return FilterSelector(
      onFilterChanged: _onFilterChanged,
      filters: _filters,
    );
  }
}
