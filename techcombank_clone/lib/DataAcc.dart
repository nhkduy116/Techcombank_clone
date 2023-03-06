// ignore_for_file: file_names

import 'package:flutter/foundation.dart';

class MyData extends ChangeNotifier {
  // Mặc định
  // String nameBank = "LE TAN CUONG";
  // String soDu = "1,235,450,000";
  // String taiKhoanBank = "1903 9809 9380 12";
  // String soTheBank = "2264";

  // String name1 = "NGUYEN HUY SON";
  // String date1a = "26 Thg 3, 2023";
  // String noidung1a = "Cuong chuyen";
  // String sotien1a = "+ 1,000,000";

  // String name2 = "LE TAN CUONG";
  // String noidung2a = "Cuong chuyen";
  // String sotien2a = "+ 100,000";

  String _sangToi = '';

  String _name = '';
  String _numberAcc = '';
  String _money = '';
  String _soThe = '';

  String _date1 = '';
  String _nguoichuyen1 = '';
  String _noidung1 = '';
  String _sotien1 = '';

  String _date2 = '';
  String _nguoichuyen2 = '';
  String _noidung2 = '';
  String _sotien2 = '';

  String get money => _money;
  String get name => _name;
  String get numberAcc => _numberAcc;
  String get date1 => _date1;
  String get date2 => _date2;
  String get nguoichuyen1 => _nguoichuyen1;
  String get nguoichuyen2 => _nguoichuyen2;
  String get noidung1 => _noidung1;
  String get noidung2 => _noidung2;
  String get sotien1 => _sotien1;
  String get sotien2 => _sotien2;
  String get sangToi => _sangToi;
  String get soThe => _soThe;

  void incrementDetail(
    String? sangToi,
    String? name,
    String? money,
    String? numberAcc,
    String? soThe,
    String? ngaychuyen1,
    String? nguoichuyen1,
    String? noidung1,
    String? sotien1,
    String? ngaychuyen2,
    String? nguoichuyen2,
    String? noidung2,
    String? sotien2,
  ) {
    _money = money!;
    _name = name!.toUpperCase();
    _numberAcc = numberAcc!;
    _nguoichuyen1 = nguoichuyen1!;
    _nguoichuyen2 = nguoichuyen2!;
    _noidung1 = noidung1!;
    _noidung2 = noidung2!;
    _date1 = ngaychuyen1!;
    _date2 = ngaychuyen2!;

    _sotien1 = sotien1!;
    if (sotien1 != "") _sotien1 = "+ $_sotien1";

    _sotien2 = sotien2!;
    if (sotien2 != "") _sotien2 = "+ $_sotien2";

    _sangToi = sangToi!;
    _soThe = soThe!;
    notifyListeners();
  }
}
