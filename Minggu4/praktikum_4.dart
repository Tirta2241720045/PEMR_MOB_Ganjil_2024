// Langkah 1:
// Ketik atau salin kode program berikut ke dalam fungsi main().
void main() {
  //digunakan untuk menambahkan elemen ke dalam list
  var list = [1, 2, 3];
  var list2 = [0, ...list];
  //digunakan untuk menampilkan list
  print(list);
  print(list2);
  print(list2.length);

// Langkah 3:
// Tambahkan kode program berikut, lalu coba eksekusi (Run) kode Anda.
  var list1 = [1, 2, null];
  print(list1);
  var list3 = [0, ...?list1];
  print(list3.length);

//Tambahkan variabel list berisi NIM Anda menggunakan Spread Operators.
  var nim = [2, 2, 4, 1, 7, 2, 0, 0, 4, 5];
  var nim2 = [0, ...?nim];
  print(nim);
  print(nim2);
  print(nim2.length);

// Langkah 4:
// Tambahkan kode program berikut, lalu coba eksekusi (Run) kode Anda
  // promoactive digunakan untuk mengecek apakah promo aktif atau tidak
  var promoActive = true;
  var nav = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];
  print(nav);

// Langkah 5:
// Tambahkan kode program berikut, lalu coba eksekusi (Run) kode Anda.
  // login digunakan untuk mengecek apakah user sudah login atau belum
  var login = 'Manager';
  var nav2 = [
    'Home',
    'Furniture',
    'Plants',
    if (login case 'Manager') 'Inventory'
  ];
  print(nav2);

// Langkah 6:
// Tambahkan kode program berikut, lalu coba eksekusi (Run) kode Anda.
  //listOfInts digunakan untuk menampung list integer
  var listOfInts = [1, 2, 3];
  //listOfStrings digunakan untuk menampung list string
  var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
  print(listOfStrings);
}
