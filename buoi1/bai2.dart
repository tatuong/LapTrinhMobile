void main() {
  List<int> danhsach = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89];
  print('Các phần tử nhỏ hơn 5 là:');
  for (int phantu in danhsach) {
    if (phantu < 5) {
      print(phantu);
    }
  }
}
