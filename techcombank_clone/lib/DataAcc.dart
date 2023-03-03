// ignore_for_file: file_names, prefer_final_fields, unused_field

import 'package:flutter/foundation.dart';

class MyData extends ChangeNotifier {
  String _money = '';
  String _name = '';
  String _numberAcc = '';
  String _lastNumberPhone = '';
  String _date1 = '';
  String _date2 = '';
  String _nguoichuyen1 = '';
  String _nguoichuyen2 = '';
  String _noidung1 = '';
  String _noidung2 = '';
  String _sotien1 = '';
  String _sotien2 = '';

  String get money => _money;
  String get name => _name;
  String get numberAcc => _numberAcc;
  String get lastNumberPhone => _lastNumberPhone;
  String get date1 => _date1;
  String get date2 => _date2;
  String get nguoichuyen1 => _nguoichuyen1;
  String get nguoichuyen2 => _nguoichuyen2;
  String get noidung1 => _noidung1;
  String get noidung2 => _noidung2;
  String get sotien1 => _sotien1;
  String get sotien2 => _sotien2;

  void incrementDetail(
    String? money,
    String? name,
    String? numberAcc,
    String? lastNumberPhone,
    String? nguoichuyen1,
    String? nguoichuyen2,
    String? noidung1,
    String? noidung2,
    String? ngaychuyen1,
    String? ngaychuyen2,
    String? sotien1,
    String? sotien2,
  ) {
    _money = money!;
    _name = name!;
    _numberAcc = numberAcc!;
    _lastNumberPhone = lastNumberPhone!;
    _nguoichuyen1 = nguoichuyen1!;
    _nguoichuyen2 = nguoichuyen2!;
    _noidung1 = noidung1!;
    _noidung2 = noidung2!;
    _date1 = ngaychuyen1!;
    _date2 = ngaychuyen2!;
    _sotien1 = sotien1!;
    _sotien2 = sotien2!;
    notifyListeners();
  }
}
