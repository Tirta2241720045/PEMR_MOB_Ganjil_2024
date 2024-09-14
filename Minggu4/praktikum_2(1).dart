// Langkah 3:
// Tambahkan kode program berikut, lalu coba eksekusi (Run) kode Anda.
void main() {
  // digunakan untuk membuat variabel halogens yang berisi set
  var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  // digunakan untuk menampilkan variabel halogens
  print(halogens);

  //digunakan untuk membuat variabel names1 yang berisi set
  var names1 = <String>{};
  //digunakan untuk membuat variabel names2 yang berisi set
  Set<String> names2 = {}; // This works, too.
  //digunakan untuk membuat variabel names3 yang berisi map
  var names3 = {}; // Creates a map, not a set.

  //digunakan untuk menampilkan variabel names1, names2, dan names3
  print(names1);
  print(names2);
  print(names3);

  //digunakan untuk menambahkan data ke dalam variabel names1
  names1.add('Nama: Muhammad Fikri');
  names1.add('NIM: 065118099');
  //digunakan untuk menampilkan variabel names1
  print(names1);

  //digunakan untuk menambahkan data ke dalam variabel names2
  names2.addAll({'Nama: Muhammad Fikri', 'NIM: 065118099'});
  //digunakan untuk menampilkan variabel names2
  print(names2);
}
