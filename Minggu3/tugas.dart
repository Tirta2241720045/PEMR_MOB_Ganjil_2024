void main() {
  // Nama lengkap dan NIM
  String nama = "Tirta Nurrochman Bintang Prawira";
  String nim = "2241720045";

  // Looping dari 2 sampai 201 (karena 0 dan 1 bukan bilangan prima)
  for (int i = 2; i <= 201; i++) {
    bool prima = true;

    // Cek apakah i adalah bilangan prima
    for (int j = 2; j <= i ~/ 2; j++) {
      if (i % j == 0) {
        prima = false;
        break;
      }
    }

    // Jika bilangan prima ditemukan
    if (prima) {
      print('$i. $nama / $nim');
    }
  }
}
