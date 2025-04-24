void main() {
  String chuoi = "Hello, World!";

  print('Chuỗi gốc: $chuoi\n');

  // a. Đảo ngược chuỗi
  String dao = daochuoi(chuoi);
  print('a. Chuỗi đảo ngược: $dao\n');

  // b. Đếm số lần xuất hiện của từng ký tự
  print('b. Số lần xuất hiện của từng ký tự:');
  Map<String, int> dem = demkytu(chuoi);
  dem.forEach((k, v) {
    print('\'$k\' xuất hiện $v lần');
  });
  print('');

  // c. Chuyển thành chữ hoa
  String hoa = chuyenhoa(chuoi);
  print('c. Chuỗi chữ hoa: $hoa');
}

// Hàm đảo ngược chuỗi
String daochuoi(String input) {
  return input.split('').reversed.join();
}

// Hàm đếm số lần xuất hiện của từng ký tự
Map<String, int> demkytu(String input) {
  Map<String, int> dem = {};

  for (int i = 0; i < input.length; i++) {
    String kytu = input[i];
    dem[kytu] = (dem[kytu] ?? 0) + 1;
  }

  return dem;
}

// Hàm chuyển thành chữ hoa
String chuyenhoa(String input) {
  return input.toUpperCase();
}
