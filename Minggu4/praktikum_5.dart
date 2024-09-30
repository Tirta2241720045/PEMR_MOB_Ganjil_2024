// Langkah 1:
// Ketik atau salin kode program berikut ke dalam fungsi main().
void main() {
  var record = ('first', a: 2, b: true, 'last');
  print(record);

//Langkah 3:
// Tambahkan kode program berikut di luar scope void main(), lalu coba eksekusi (Run) kode Anda.
  (int, int) tukar((int, int) record) {
    var (a, b) = record;
    return (b, a);
  }

  print(tukar((0, 1)));

//Langkah 4:
//Tambahkan kode program berikut di dalam scope void main(), lalu coba eksekusi (Run) kode Anda.
// Record type annotation in a variable declaration:
// Selesaikan error dibawah ini
  Map<String, dynamic> mahasiswa = {
    "nama": "Tirta Nurrochman Bintang Prawira",
    "nim": 2241720045
  };
  print(mahasiswa);

//Langkah 5:
//Tambahkan kode program berikut di dalam scope void main(), lalu coba eksekusi (Run) kode Anda.
  var mahasiswa2 =
      ('Tirta Nurrochman Bintang Prawira', a: 2241720045, b: true, 'last');

  print(mahasiswa2.$1); // Prints 'first'
  print(mahasiswa2.a); // Prints 2
  print(mahasiswa2.b); // Prints true
  print(mahasiswa2.$2); // Prints 'last'
}
