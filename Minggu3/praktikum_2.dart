void main() {
  //Pada kode program ini terdapat perbedaan pada penggunaan perulangan for dan while
  //Pada kode di bawah ini, terdapat variabel counter yang memiliki nilai 0
  int counter = 0;
  //Pada kode di bawah ini, terdapat perulangan while yang digunakan untuk mencetak nilai dari variabel counter
  while (counter < 33) {
    print(counter);
    counter++;
  }
  //Pada kode di bawah ini, terdapat perulangan do while yang digunakan untuk mencetak nilai dari variabel counter
  do {
    print(counter);
    counter++;
  } while (counter < 77);
}
