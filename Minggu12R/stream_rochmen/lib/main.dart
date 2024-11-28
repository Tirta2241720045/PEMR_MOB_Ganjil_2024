import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:math';

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
  Color bgColor = Colors.white; // Warna default putih
  late NumberStream numberStream;
  late StreamController<int> numberStreamController;
  int lastNumber = 0;
  late StreamTransformer<int, int> transformer;

  @override
  void initState() {
    super.initState();

    // Inisialisasi NumberStream dan StreamTransformer
    numberStream = NumberStream();
    numberStreamController = numberStream.controller;

    transformer = StreamTransformer<int, int>.fromHandlers(
      handleData: (value, sink) {
        sink.add(value * 10); // Kalikan angka dengan 10
      },
      handleError: (error, trace, sink) {
        sink.add(-1); // Tangani error dengan mengirimkan -1
      },
      handleDone: (sink) => sink.close(),
    );

    numberStreamController.stream.transform(transformer).listen((event) {
      setState(() {
        lastNumber = event; // Perbarui angka terakhir
      });
    }).onError((error) {
      setState(() {
        lastNumber = -1; // Jika ada error, tampilkan -1
      });
    });

    // Inisialisasi ColorStream (dikomentari)
    // colorStream = ColorStream();
    // changeColor();
  }

  /*
  void changeColor() {
    colorStream.getColors().listen((eventColor) {
      setState(() {
        bgColor = eventColor; // Perbarui warna latar
      });
    });
  }
  */

  void addRandomNumber() {
    Random random = Random();
    int myNum = random.nextInt(10); // Angka acak dari 0-9
    numberStream.addNumberToSink(myNum);
    // numberStream.addError(); // Uncomment untuk mengetes error
  }

  @override
  void dispose() {
    numberStreamController.close(); // Tutup controller saat widget dihapus
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          'Stream - by Rochmen',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        width: double.infinity,
        color: bgColor, // Latar belakang putih
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

// Stream untuk menghasilkan warna secara acak
class ColorStream {
  final StreamController<Color> _colorController = StreamController<Color>();

  Stream<Color> getColors() async* {
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      yield Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
    }
  }

  void dispose() {
    _colorController.close();
  }
}

// Stream untuk menghasilkan angka
class NumberStream {
  final StreamController<int> controller = StreamController<int>();

  void addNumberToSink(int number) {
    controller.sink.add(number);
  }

  void addError() {
    controller.sink.addError('Error occurred');
  }

  void dispose() {
    controller.close();
  }
}
