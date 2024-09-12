void main() {
  // Pada kode di bawah ini, terdapat variabel test yang memiliki nilai "test2"
  String test = "test2";
  if (test == "test1") {
    print("Test1");
  } else if (test == "test2") {
    print("Test2");
  } else {
    print("Something else");
  }
  // Kode di atas akan mencetak "Test2" karena variabel test memiliki nilai "test2"
  if (test == "test2") print("Test2 again");
  // Kode di atas akan mencetak "Test2 again" karena variabel test memiliki nilai "test2"
  String test1 = "true";
  if (test1 == "true") {
    // Kode di bawah ini akan mencetak "Kebenaran" karena variabel test1 memiliki nilai "true"
    print("Kebenaran");
  }
}
