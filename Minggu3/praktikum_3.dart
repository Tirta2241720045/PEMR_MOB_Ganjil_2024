void main() {
  // Pada kode di bawah ini, terdapat perulangan for yang digunakan untuk mencetak nilai dari variabel index
  for (int index = 10; index < 27; index++) {
    print(index);
    // Pada kode di bawah ini, terdapat kondisi if yang digunakan untuk menghentikan perulangan jika nilai dari variabel index sama dengan 21
    if (index == 21)
      break;
    // Pada kode di bawah ini, terdapat kondisi else if yang digunakan untuk melanjutkan perulangan jika nilai dari variabel index lebih dari 1 atau kurang dari 7
    else if (index > 1 || index < 7) continue;
    // Pada kode di bawah ini, terdapat kondisi else yang digunakan untuk mencetak nilai dari variabel index
    print(index);
  }
}
