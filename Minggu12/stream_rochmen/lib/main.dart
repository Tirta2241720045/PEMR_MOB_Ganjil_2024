import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math'; // Untuk generate angka acak
import 'stream.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream - by Rochmen',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const StreamHomePage(),
    );
  }
}

class StreamHomePage extends StatefulWidget {
  const StreamHomePage({super.key});

  @override
  State<StreamHomePage> createState() => _StreamHomePageState();
}

class _StreamHomePageState extends State<StreamHomePage> {
  Color bgColor = Colors.blueGrey;
  late ColorStream colorStream;
  late NumberStream numberStream;

  // Variabel untuk menyimpan StreamController dan angka terakhir
  late StreamController<int> numberStreamController;
  int lastNumber = 0;

  @override
  void initState() {
    super.initState();
    // Inisialisasi ColorStream
    colorStream = ColorStream();
    changeColor();

    // Inisialisasi NumberStream dan StreamController
    numberStream = NumberStream();
    numberStreamController = numberStream.controller;

    // Mendengarkan stream dari numberStreamController
    numberStreamController.stream.listen((event) {
      setState(() {
        lastNumber = event;
      });
    });
  }

  void changeColor() {
    // Mendengarkan perubahan warna dari stream
    colorStream.getColors().listen((eventColor) {
      setState(() {
        bgColor = eventColor;
      });
    });
  }

  void addRandomNumber() {
    Random random = Random();
    int myNum = random.nextInt(10); // Angka acak dari 0-9
    numberStream.addNumberToSink(myNum); // Tambahkan angka ke stream
  }

  @override
  void dispose() {
    // Tutup numberStreamController
    numberStreamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Colors.purple, // Menambahkan latar belakang ungu untuk AppBar
        title: const Text(
          'Stream - by Rochmen',
          style: TextStyle(color: Colors.white), // Warna teks tetap putih
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              lastNumber.toString(),
              style: const TextStyle(fontSize: 48, color: Colors.black),
            ),
            ElevatedButton(
              onPressed: () => addRandomNumber(),
              child: const Text('New Random Number'),
            ),
          ],
        ),
      ),
    );
  }
}
