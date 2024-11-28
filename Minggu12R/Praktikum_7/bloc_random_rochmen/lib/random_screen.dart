import 'package:flutter/material.dart';
import 'random_bloc.dart';

class RandomScreen extends StatefulWidget {
  const RandomScreen({super.key});

  @override
  State<RandomScreen> createState() => _RandomScreenState();
}

class _RandomScreenState extends State<RandomScreen> {
  final _randomNumberBloc = RandomNumberBloc();

  @override
  void dispose() {
    _randomNumberBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Generator Angka Acak',
          style: TextStyle(color: Colors.white), // Text color to white
        ),
        backgroundColor: Colors.purple, // AppBar background color to purple
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: _randomNumberBloc.randomNumber,
          initialData: 0,
          builder: (context, snapshot) {
            return Text(
              'Angka Acak: ${snapshot.data}',
              style: const TextStyle(fontSize: 24),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _randomNumberBloc.generateRandom.add(null);
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
