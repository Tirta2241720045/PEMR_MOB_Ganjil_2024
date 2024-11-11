# master_plan

A new Flutter project.

# Nama: Tirta Nurrochman Bintang Prawira
# NIM: 2241720045
# Kelas/Absen: TI-3A/27

# Tugas Praktikum
1. Selesaikan langkah-langkah praktikum tersebut, lalu dokumentasikan berupa GIF hasil akhir praktikum beserta penjelasannya di file README.md! Jika Anda menemukan ada yang error atau tidak berjalan dengan baik, silakan diperbaiki.
# Kode Program:
- ## task.dart
![Screenshot master_plan](images/P101.png)
- ## plan.dart
![Screenshot master_plan](images/P102.png)
- ## data_layer.dart
![Screenshot master_plan](images/P103.png)
- ## main.dart
![Screenshot master_plan](images/P104.png)
- ## plan_screen.dart
![Screenshot master_plan](images/P105.png)
# Output
![Screenshot master_plan](images/P106.png)
2. Jelaskan maksud dari langkah 4 pada praktikum tersebut! Mengapa dilakukan demikian?
- Jawab: Langkah 4 bertujuan untuk menyederhanakan proses pengimporan model dengan membuat file `data_layer.dart` yang menggabungkan beberapa file model (seperti `plan.dart` dan `task.dart`) menggunakan perintah `export`. Dengan begitu, file lain yang membutuhkan model-model ini hanya perlu mengimpor `data_layer.dart` daripada mengimpor setiap file model secara terpisah. Pendekatan ini membuat kode lebih rapi dan mudah dikelola seiring berkembangnya aplikasi, karena cukup menambahkan ekspor di `data_layer.dart` ketika model baru dibuat, tanpa perlu mengubah impor di setiap file.

3. Mengapa perlu variabel plan di langkah 6 pada praktikum tersebut? Mengapa dibuat konstanta ?
- Jawab: Variabel `plan` pada langkah 6 digunakan untuk menyimpan objek `Plan`, yang berfungsi sebagai wadah data utama bagi layar `PlanScreen` untuk mengelola dan menampilkan daftar tugas atau rencana. Variabel ini dibuat sebagai konstanta (`const Plan()`) karena objek `Plan` tidak memiliki data yang dinamis saat inisialisasi, sehingga tidak memerlukan perubahan setelah dibuat. Penggunaan `const` juga membuat penggunaan memori lebih efisien, karena compiler dapat mengoptimalkan objek ini. Selain itu, satu instance `Plan` yang tetap cukup untuk menjadi referensi awal data yang akan digunakan pada layar `PlanScreen`.

4. Lakukan capture hasil dari Langkah 9 berupa GIF, kemudian jelaskan apa yang telah Anda buat!
- Jawab: Widget `_buildTaskTile` digunakan untuk menampilkan setiap tugas dalam daftar `plan.tasks` sebagai `ListTile` yang dinamis, dengan kotak centang (`Checkbox`) dan `TextFormField` untuk memungkinkan pengguna menandai tugas sebagai selesai atau mengubah deskripsinya secara langsung. Kotak centang akan mengubah status `complete` dari tugas tersebut, sementara perubahan teks deskripsi diperbarui melalui `onChanged`, sehingga objek `plan` diperbarui setiap kali ada interaksi. Widget ini mempermudah pengguna dalam mengelola daftar tugas, baik menandai tugas maupun mengeditnya, dan memastikan tampilan selalu sinkron dengan data yang ada.

5. Apa kegunaan method pada Langkah 11 dan 13 dalam lifecyle state ?
- Jawab: Metode `initState()` dan `dispose()` digunakan dalam siklus hidup state untuk menginisialisasi dan membersihkan objek `scrollController`. Pada `initState()`, `scrollController` dibuat dan ditambahkan *listener* untuk menyembunyikan keyboard secara otomatis saat pengguna menggulir, membantu menjaga tampilan tetap bersih. Pada `dispose()`, `scrollController` dibersihkan saat widget tidak lagi digunakan, yang membebaskan sumber daya dan mencegah kebocoran memori. Keduanya memastikan kontrol scroll bekerja optimal sesuai siklus hidup widget tanpa membebani aplikasi.

6. Kumpulkan laporan praktikum Anda berupa link commit atau repository GitHub ke dosen yang telah disepakati !
- Jawab: Sudah

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
