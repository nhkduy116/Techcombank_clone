// ignore_for_file: file_names, prefer_final_fields, unused_field

import 'package:flutter/foundation.dart';

class MyData extends ChangeNotifier {
  String _money = '10,000,000,000';
  String _name = 'LE TAN CUONG';
  String _numberAcc = '1903 98099 38012';
  String _lastNumberPhone = '2264';

  String get money => _money;
  String get name => _name;
  String get numberAcc => _numberAcc;
  String get lastNumberPhone => _lastNumberPhone;

  void incrementDetail(String money, String name, String numberAcc, String lastNumberPhone) {
    _money = money;
    _name = name;
    _numberAcc = numberAcc;
    _lastNumberPhone = lastNumberPhone;
    notifyListeners();
  }
}
