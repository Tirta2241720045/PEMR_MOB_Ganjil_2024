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
  late NumberStream numberStream;
  late StreamController<int> numberStreamController;
  late StreamSubscription subscription2; // Ditambahkan
  String values = ''; // Ditambahkan
  int lastNumber = 0;
  StreamSubscription? subscription;
  StreamSubscription? transformedSubscription;

  @override
  void initState() {
    super.initState();
    numberStream = NumberStream();

    // Ubah controller menjadi broadcast
    numberStreamController = StreamController<int>.broadcast();

    // Stream yang sudah broadcast
    Stream<int> broadcastStream = numberStreamController.stream;

    // Transformer untuk mengalikan nilai
    StreamTransformer<int, int> transformer =
        StreamTransformer<int, int>.fromHandlers(
      handleData: (value, sink) {
        sink.add(value * 10);
      },
      handleError: (error, trace, sink) {
        sink.add(-1);
      },
      handleDone: (sink) => sink.close(),
    );

    // Listener pertama untuk stream asli
    subscription = broadcastStream.listen((event) {
      setState(() {
        lastNumber = event;
      });
    }, onError: (error) {
      setState(() {
        lastNumber = -1;
      });
    }, onDone: () {
      print('onDone was called');
    });

    // Listener kedua untuk stream yang ditransformasi
    transformedSubscription =
        broadcastStream.transform(transformer).listen((event) {
      setState(() {
        lastNumber = event;
      });
    }, onError: (error) {
      setState(() {
        lastNumber = -1;
      });
    }, onDone: () {
      print('Transformed stream onDone was called');
    });

    // Menambahkan listener dari instruksi
    subscription = broadcastStream.listen((event) {
      setState(() {
        values += '$event - ';
      });
    });

    subscription2 = broadcastStream.listen((event) {
      setState(() {
        values += '$event - ';
      });
    });
  }

  @override
  void dispose() {
    subscription?.cancel();
    subscription2.cancel(); // Pastikan listener kedua juga dibatalkan
    transformedSubscription?.cancel();
    numberStreamController.close();
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
        color: Colors.white, // Default white background
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              lastNumber.toString(),
              style: const TextStyle(fontSize: 48, color: Colors.black),
            ),
            Text(
              values,
              style: const TextStyle(fontSize: 18, color: Colors.blue),
            ),
            ElevatedButton(
              onPressed: () => addRandomNumber(),
              child: const Text('New Random Number'),
            ),
            ElevatedButton(
              onPressed: () => stopStream(),
              child: const Text('Stop Stream'),
            ),
          ],
        ),
      ),
    );
  }

  void addRandomNumber() {
    Random random = Random();
    int myNum = random.nextInt(10);
    if (!numberStreamController.isClosed) {
      numberStreamController.sink.add(myNum);
    } else {
      setState(() {
        lastNumber = -1;
      });
    }
  }

  void stopStream() {
    // Cancel the existing subscriptions
    subscription?.cancel();
    subscription2.cancel(); // Tambahkan ini untuk cancel subscription2
    transformedSubscription?.cancel();

    // Close the StreamController to trigger onDone
    numberStreamController.close();

    // This triggers the onDone callback in the listeners
    setState(() {
      lastNumber = -1;
    });
  }
}

class NumberStream {
  final StreamController<int> controller = StreamController<int>.broadcast();

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
