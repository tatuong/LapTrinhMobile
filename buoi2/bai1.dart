import 'dart:io';

// ========================
// Lớp sach
// ========================
class sach {
  String masach;
  String tensach;
  String tacgia;
  int namxuatban;

  sach(this.masach, this.tensach, this.tacgia, this.namxuatban);

  void hienthithongtin() {
    print(
      'Mã sách: $masach, Tên sách: $tensach, Tác giả: $tacgia, Năm XB: $namxuatban',
    );
  }
}

// ========================
// Lớp docgia
// ========================
class docgia {
  String madocgia;
  String tendocgia;

  docgia(this.madocgia, this.tendocgia);

  void hienthithongtin() {
    print('Mã độc giả: $madocgia, Tên độc giả: $tendocgia');
  }
}

// ========================
// Lớp phieumuon
// ========================
class phieumuon {
  docgia dg;
  sach s;
  DateTime ngaymuon;

  phieumuon(this.dg, this.s) : ngaymuon = DateTime.now();

  void hienthithongtin() {
    print(
      'Độc giả: ${dg.tendocgia} - Sách: ${s.tensach} - Ngày mượn: ${ngaymuon.toLocal()}',
    );
  }
}

// ========================
// Lớp thuvien
// ========================
class thuvien {
  List<sach> danhsachsach = [];
  List<docgia> danhsachdocgia = [];
  List<phieumuon> danhsachphieumuon = [];

  void themsach(sach s) {
    danhsachsach.add(s);
  }

  void themdocgia(docgia dg) {
    danhsachdocgia.add(dg);
  }

  void muonsach(String madocgia, String masach) {
    var dg = danhsachdocgia.where((doc) => doc.madocgia == madocgia).toList();
    var s = danhsachsach.where((sa) => sa.masach == masach).toList();

    if (dg.isNotEmpty && s.isNotEmpty) {
      danhsachphieumuon.add(phieumuon(dg.first, s.first));
      print('Mượn sách thành công!');
    } else {
      print('Không tìm thấy độc giả hoặc sách!');
    }
  }

  void hienthidanhsachsach() {
    if (danhsachsach.isEmpty) {
      print('Chưa có sách nào.');
      return;
    }
    for (var s in danhsachsach) {
      s.hienthithongtin();
    }
  }

  void hienthidanhsachdocgia() {
    if (danhsachdocgia.isEmpty) {
      print('Chưa có độc giả nào.');
      return;
    }
    for (var dg in danhsachdocgia) {
      dg.hienthithongtin();
    }
  }

  void hienthidanhsachphieumuon() {
    if (danhsachphieumuon.isEmpty) {
      print('Chưa có phiếu mượn nào.');
      return;
    }
    for (var pm in danhsachphieumuon) {
      pm.hienthithongtin();
    }
  }
}

// ========================
// Hàm main
// ========================
void main() {
  var tv = thuvien();
  int luachon = -1;

  do {
    print('\n==== MENU ====');
    print('1. Thêm sách');
    print('2. Thêm độc giả');
    print('3. Mượn sách');
    print('4. Xem danh sách sách');
    print('5. Xem danh sách độc giả');
    print('6. Xem phiếu mượn');
    print('0. Thoát');
    stdout.write('Chọn: ');
    luachon = int.tryParse(stdin.readLineSync() ?? '') ?? -1;

    switch (luachon) {
      case 1:
        stdout.write('Nhập mã sách: ');
        var mas = stdin.readLineSync()!;
        stdout.write('Nhập tên sách: ');
        var tens = stdin.readLineSync()!;
        stdout.write('Nhập tác giả: ');
        var tgia = stdin.readLineSync()!;
        stdout.write('Nhập năm xuất bản: ');
        var namxb = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
        tv.themsach(sach(mas, tens, tgia, namxb));
        break;

      case 2:
        stdout.write('Nhập mã độc giả: ');
        var madg = stdin.readLineSync()!;
        stdout.write('Nhập tên độc giả: ');
        var tendg = stdin.readLineSync()!;
        tv.themdocgia(docgia(madg, tendg));
        break;

      case 3:
        stdout.write('Nhập mã độc giả: ');
        var madgmuon = stdin.readLineSync()!;
        stdout.write('Nhập mã sách: ');
        var masmuon = stdin.readLineSync()!;
        tv.muonsach(madgmuon, masmuon);
        break;

      case 4:
        tv.hienthidanhsachsach();
        break;

      case 5:
        tv.hienthidanhsachdocgia();
        break;

      case 6:
        tv.hienthidanhsachphieumuon();
        break;

      case 0:
        print('Kết thúc chương trình.');
        break;

      default:
        print('Chọn sai. Vui lòng chọn lại!');
    }
  } while (luachon != 0);
}
