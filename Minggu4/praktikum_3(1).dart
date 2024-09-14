// Langkah 3:
// Tambahkan kode program berikut, lalu coba eksekusi (Run) kode Anda.
void main() {
  //digunakan untuk membuat variabel gifts yang berisi map
  var gifts = {
    // Key:    Value
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 1,
    'Tirta Nurrochman Bintang Prawira': 2241720045
  };

  //digunakan untuk membuat variabel nobleGases yang berisi map
  var nobleGases = {
    2: 'helium',
    10: 'neon',
    18: 2,
    2241720045: 'Tirta Nurrochman Bintang Prawira'
  };

  //digunakan untuk menampilkan variabel gifts dan nobleGases
  //digunakan untuk membuat variabel mhs1 yang berisi map
  var mhs1 = Map<String, String>();
  gifts['first'] = 'partridge';
  gifts['second'] = 'turtledoves';
  gifts['fifth'] = 'golden rings';
  gifts['Tirta Nurrochman Bintang Prawira'] = '2241720045';

  //digunakan untuk membuat variabel mhs2 yang berisi map
  var mhs2 = Map<int, String>();
  nobleGases[2] = 'helium';
  nobleGases[10] = 'neon';
  nobleGases[18] = 'argon';
  nobleGases[2241720045] = 'Tirta Nurrochman Bintang Prawira';
  //digunakan untuk menampilkan variabel gifts dan nobleGases
  print(gifts);
  print(nobleGases);
}
