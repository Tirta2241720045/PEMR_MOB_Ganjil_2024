// Langkah 1:
// Ketik atau salin kode program berikut ke dalam void main().
// membuat list dengan nama list yang berisi 3 elemen
void main() {
  var list = [
    1,
    2,
    3,
  ];
  // mengecek panjang list
  assert(list.length == 3);
  assert(list[1] == 2);
  // menampilkan elemen list ke 1
  print(list.length);
  print(list[1]);
  // mengubah elemen list ke 1 menjadi 1
  list[1] = 1;
  // mengecek apakah elemen list ke 1 sudah berubah
  assert(list[1] == 1);
  // menampilkan elemen list ke 1
  print(list[1]);
}
