import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  CameraController? _controller;
  Future<void>? _initializeControllerFuture;
  bool _isCameraActive = true;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    if (cameras.isEmpty) {
      print('Tidak ada kamera yang tersedia');
      return;
    }

    _controller = CameraController(
      cameras[0],
      ResolutionPreset.low,
    );

    _initializeControllerFuture = _controller!.initialize().then((_) {
      setState(() {
        _isCameraActive = true;
      });
    });
  }

  Future<void> _takePicture() async {
    await _initializeControllerFuture;
    final image = await _controller!.takePicture();
    bool? shouldSave = await _showSaveDialog();
    if (shouldSave == true) {
      await _requestPermissionAndSaveImage(image.path);
    } else {
      print('Gambar tidak disimpan.');
    }
  }

  Future<bool?> _showSaveDialog() {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Konfirmasi Penyimpanan'),
          content: const Text('Apakah Anda ingin menyimpan gambar?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Tidak'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              child: const Text('Ya'),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _requestPermissionAndSaveImage(String imagePath) async {
    // Meminta izin akses penyimpanan
    var status = await Permission.storage.request();
    if (status.isGranted) {
      await _saveImage(imagePath);
    } else {
      print("Izin akses ditolak");
    }
  }

  Future<void> _saveImage(String imagePath) async {
    try {
      // Membuat folder baru di galeri
      final Directory? directory = await getExternalStorageDirectory();
      final String newPath = '${directory!.path}/myApp';
      final Directory newDir = Directory(newPath);

      if (!await newDir.exists()) {
        await newDir.create(recursive: true);
      }

      // Salin gambar ke folder yang ditentukan
      final File imageFile = File(imagePath);
      final String finalPath =
          '${newDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
      await imageFile.copy(finalPath);
      print('Gambar disimpan di: $finalPath');
    } catch (e) {
      print("Error saving image: $e");
    }
  }

  void _closeCamera() {
    _controller?.dispose();
    setState(() {
      _isCameraActive = false;
    });
  }

  void _openCamera() {
    _initializeCamera();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera Page'),
      ),
      body: _isCameraActive
          ? FutureBuilder<void>(
              future: _initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Column(
                    children: <Widget>[
                      Expanded(
                        child: AspectRatio(
                          aspectRatio: 16 / 9,
                          child: CameraPreview(_controller!),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ElevatedButton(
                              onPressed: _takePicture,
                              child: const Text('Ambil Gambar'),
                            ),
                            const SizedBox(width: 20),
                            IconButton(
                              icon: const Icon(Icons.stop,
                                  color: Colors.red, size: 40),
                              onPressed: _closeCamera,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return const Center(
                      child: Text('Error initializing camera.'));
                }
              },
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Beralih ke halaman kamera',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _openCamera,
                    child: const Text('Open Camera'),
                  ),
                ],
              ),
            ),
    );
  }
}
