import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String myPosition = '';
  bool isLoading = true; // Variabel untuk menampilkan indikator loading

  @override
  void initState() {
    super.initState();
    getPosition().then((Position myPos) async {
      await Future.delayed(const Duration(seconds: 3)); // Simulasi delay
      myPosition =
          'Latitude: ${myPos.latitude.toString()}, Longitude: ${myPos.longitude.toString()}';
      setState(() {
        isLoading = false; // Set loading false setelah data diterima
        myPosition = myPosition;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Current Location - Rochmen'),
      ),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator() // Menampilkan loading
            : Text(myPosition), // Menampilkan posisi setelah data diterima
      ),
    );
  }

  Future<Position> getPosition() async {
    await Geolocator.requestPermission(); // Meminta izin lokasi
    await Geolocator
        .isLocationServiceEnabled(); // Mengecek apakah layanan lokasi aktif
    Position? position =
        await Geolocator.getCurrentPosition(); // Mendapatkan posisi saat ini
    return position;
  }
}
