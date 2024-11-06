import 'dart:convert';
import 'dart:html' as html;
import 'dart:typed_data';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io';

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  Future<Uint8List> _loadImage() async {
    final reader = html.FileReader();
    final completer = Completer<Uint8List>();

    reader.onLoadEnd.listen((e) {
      completer.complete(reader.result as Uint8List);
    });

    final file = html.File([
      await html.window.fetch(imagePath).then((response) => response.blob())
    ], imagePath);
    reader.readAsArrayBuffer(file);

    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture - 2241720045')),
      body: kIsWeb
          ? FutureBuilder<Uint8List>(
              future: _loadImage(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    return Image.memory(snapshot.data!);
                  } else {
                    return const Center(child: Text('Gambar tidak tersedia.'));
                  }
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            )
          : Image.file(File(imagePath)),
    );
  }
}
