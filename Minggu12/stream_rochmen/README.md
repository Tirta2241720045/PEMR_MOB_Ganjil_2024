# stream_rochmen

A new Flutter project.

# Nama: Tirta Nurrochman Bintang Prawira
# NIM: 2241720045
# Kelas/Absen: TI-3A/27

- Soal 1
- Tambahkan nama panggilan Anda pada title app sebagai identitas hasil pekerjaan Anda.
![Screenshot stream](images/T101.png)
- Gantilah warna tema aplikasi sesuai kesukaan Anda.
![Screenshot stream](images/T102.png)
- Lakukan commit hasil jawaban Soal 1 dengan pesan "W12: Jawaban Soal 1"

- Soal 2
- Tambahkan 5 warna lainnya sesuai keinginan Anda pada variabel colors tersebut.
![Screenshot stream](images/T103.png)
- Lakukan commit hasil jawaban Soal 2 dengan pesan "W12: Jawaban Soal 2"

- Soal 3
- Jelaskan fungsi keyword yield* pada kode tersebut!
- Jawab: `yield*` pada kode tersebut digunakan untuk mengirimkan seluruh elemen dari stream lain ke dalam stream utama secara langsung. Dengan menggunakan `yield*`, elemen yang dihasilkan dari `Stream.periodic(...)` akan diteruskan ke stream utama `getColors()` tanpa perlu mengambil setiap elemen secara manual, sehingga seluruh hasil dari stream periodik ini dapat dikirimkan ke stream utama secara efisien.
- Apa maksud isi perintah kode tersebut?
- Jawab: Kode `Stream.periodic(const Duration(seconds: 1), (int t) {...})` menghasilkan sebuah stream yang mengirimkan data setiap detik. Fungsi `(int t) { int index = t % colors.length; return colors[index]; }` digunakan untuk mengambil warna dari daftar `colors` secara berurutan dengan memodulasi indeks terhadap panjang daftar, memastikan bahwa warna akan diulang ketika mencapai akhir daftar. Hasilnya, setiap detik `getColors()` akan mengirimkan warna baru, secara terus-menerus mengulang daftar warna.
- Lakukan commit hasil jawaban Soal 3 dengan pesan "W12: Jawaban Soal 3"

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
