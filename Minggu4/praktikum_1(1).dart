// Langkah 3:
// Ubah kode pada langkah 1 menjadi variabel final yang mempunyai index = 5 dengan default value = null. Isilah nama dan NIM Anda pada elemen index ke-1 dan ke-2. Lalu print dan capture hasilnya.
void main() {
  final list = [
    null,
    'Tirta Nurrochman Bintang Prawira',
    '2241720045',
    null,
    null,
  ];
  // mengecek panjang list
  assert(list.length == 5);
  assert(list[1] == 'Tirta Nurrochman Bintang Prawira');
  assert(list[2] == '2241720045');
  // menampilkan elemen list ke 1
  print(list.length);
  print(list[1]);
  print(list[2]);
}
