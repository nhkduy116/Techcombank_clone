// ignore_for_file: prefer_const_constructors, file_names, no_leading_underscores_for_local_identifiers, unused_local_variable, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, unused_import, unnecessary_import, unnecessary_new, unnecessary_null_comparison, prefer_typing_uninitialized_variables, unused_field, implementation_imports, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techcombank_clone/DataAcc.dart';
import 'package:techcombank_clone/HomeLoginScreen.dart';
import 'package:techcombank_clone/HomeScreen.dart';

class ManageDetailAcc extends StatefulWidget {
  const ManageDetailAcc({super.key});

  @override
  State<ManageDetailAcc> createState() => _ManageDetailAccState();
}

class _ManageDetailAccState extends State<ManageDetailAcc> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController sangToi = new TextEditingController();
  final TextEditingController userAcc = new TextEditingController();
  final TextEditingController money = new TextEditingController();
  final TextEditingController numberAcc = new TextEditingController();
  final TextEditingController nguoichuyen1 = new TextEditingController();
  final TextEditingController nguoichuyen2 = new TextEditingController();
  final TextEditingController noidung1 = new TextEditingController();
  final TextEditingController noidung2 = new TextEditingController();
  final TextEditingController date1 = new TextEditingController();
  final TextEditingController date2 = new TextEditingController();
  final TextEditingController sotien1 = new TextEditingController();
  final TextEditingController sotien2 = new TextEditingController();
  final TextEditingController soThe = new TextEditingController();

  void setData(MyData myData) async {
    final setData = await SharedPreferences.getInstance();
    setState(() {
      if (myData.sangToi.toString().trim() != "") {
        if (myData.sangToi.toString().trim() == "xoa") {
          setData.setString("sangToi", "");
        } else {
          setData.setString("sangToi", myData.sangToi.toString());
        }
      }

      if (myData.name.toString().trim() != "") {
        if (myData.name.toString().trim() == "xoa") {
          setData.setString("name", "");
        } else {
          setData.setString("name", myData.name.toString());
        }
      }

      if (myData.numberAcc.toString().trim() != "") {
        if (myData.numberAcc.toString() == "xoa") {
          setData.setString("numberAcc", "");
        } else {
          setData.setString("numberAcc", myData.numberAcc.toString());
        }
      }
      if (myData.money.toString().trim() != "") {
        if (myData.money.toString() == "xoa") {
          setData.setString("money", "");
        } else {
          setData.setString("money", myData.money.toString());
        }
      }
      if (myData.soThe.toString().trim() != "") {
        if (myData.soThe.toString() == "xoa") {
          setData.setString("soThe", "");
        } else {
          setData.setString("soThe", myData.soThe.toString());
        }
      }

      if (myData.date1.toString().trim() != "") {
        if (myData.date1.toString() == "xoa") {
          setData.setString("date1", "");
        } else {
          setData.setString("date1", myData.date1.toString());
        }
      }
      if (myData.nguoichuyen1.toString().trim() != "") {
        if (myData.nguoichuyen1.toString() == "xoa") {
          setData.setString("nguoichuyen1", "");
        } else {
          setData.setString("nguoichuyen1", myData.nguoichuyen1.toString());
        }
      }
      if (myData.noidung1.toString().trim() != "") {
        if (myData.noidung1.toString() == "xoa") {
          setData.setString("noidung1", "");
        } else {
          setData.setString("noidung1", myData.noidung1.toString());
        }
      }
      if (myData.sotien1.toString().trim() != "") {
        if (myData.sotien1.toString() == "xoa") {
          setData.setString("sotien1", "");
        } else {
          setData.setString("sotien1", myData.sotien1.toString());
        }
      }

      if (myData.date2.toString().trim() != "") {
        if (myData.date2.toString() == "xoa") {
          setData.setString("date2", "");
        } else {
          setData.setString("date2", myData.date2.toString());
        }
      }
      if (myData.nguoichuyen2.toString().trim() != "") {
        if (myData.nguoichuyen2.toString() == "xoa") {
          setData.setString("nguoichuyen2", "");
        } else {
          setData.setString("nguoichuyen2", myData.nguoichuyen2.toString());
        }
      }
      if (myData.noidung2.toString().trim() != "") {
        if (myData.noidung2.toString() == "xoa") {
          setData.setString("noidung2", "");
        } else {
          setData.setString("noidung2", myData.noidung2.toString());
        }
      }
      if (myData.sotien2.toString().trim() != "") {
        if (myData.sotien2.toString() == "xoa") {
          setData.setString("sotien2", "");
        } else {
          setData.setString("sotien2", myData.sotien2.toString());
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Container(
      color: Colors.brown,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            width: _width,
            height: _height,
            color: Colors.brown,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    SizedBox(
                      height: 14,
                    ),
                    Container(
                      child: Column(children: [
                        Container(
                          child: Text(
                            "Thông tin chung\nĐiền \"xoa\" để xóa",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        TextForms(
                            controller: sangToi, label: 'Thời gian (vd: sáng)'),
                        SizedBox(
                          height: 14,
                        ),
                        TextForms(controller: userAcc, label: 'Chủ tài khoản'),
                        SizedBox(
                          height: 20,
                        ),
                        TextForms(
                            controller: money, label: 'Số dư (vd:123,123,123)'),
                        SizedBox(
                          height: 20,
                        ),
                        TextForms(
                            controller: numberAcc,
                            label: 'Số tài khoản (vd:1902 3654 1478 12)'),
                        SizedBox(
                          height: 14,
                        ),
                        TextForms(controller: soThe, label: '4 số cuối thẻ'),
                        SizedBox(
                          height: 14,
                        ),
                      ]),
                    ),
                    Container(
                      child: Column(children: [
                        Text("Chuyển khoản 1",
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                        SizedBox(
                          height: 14,
                        ),
                        TextForms(
                            controller: date1,
                            label: "Ngày chuyển (vd:12 Thg 02, 2023)"),
                        SizedBox(
                          height: 30,
                        ),
                        TextForms(
                            controller: nguoichuyen1, label: "Người chuyển"),
                        SizedBox(
                          height: 30,
                        ),
                        TextForms(
                            controller: noidung1,
                            label: "Nội dung chuyển khoản"),
                        SizedBox(
                          height: 30,
                        ),
                        TextForms(
                            controller: sotien1,
                            label: "Số tiền (vd: 123,123,123)"),
                        SizedBox(
                          height: 14,
                        ),
                      ]),
                    ),
                    Container(
                      child: Column(children: [
                        Text("Chuyển khoản 2",
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                        SizedBox(
                          height: 14,
                        ),
                        TextForms(
                            controller: date2,
                            label: "Ngày chuyển (vd:4 Thg 03, 2023)"),
                        SizedBox(
                          height: 30,
                        ),
                        TextForms(
                            controller: nguoichuyen2, label: "Người chuyển"),
                        SizedBox(
                          height: 30,
                        ),
                        TextForms(
                            controller: noidung2,
                            label: "Nội dung chuyển khoản"),
                        SizedBox(
                          height: 30,
                        ),
                        TextForms(
                            controller: sotien2,
                            label: "Số tiền (vd: 123,123,123)"),
                        SizedBox(
                          height: 14,
                        ),
                      ]),
                    ),
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ),
                        onPressed: () {
                          final myData =
                              Provider.of<MyData>(context, listen: false);
                          myData.incrementDetail(
                            sangToi.text.toString(),
                            userAcc.text.toString(),
                            money.text.toString(),
                            numberAcc.text.toString(),
                            soThe.text.toString(),
                            date1.text.toString(),
                            nguoichuyen1.text.toString(),
                            noidung1.text.toString(),
                            sotien1.text.toString(),
                            date2.text.toString(),
                            nguoichuyen2.text.toString(),
                            noidung2.text.toString(),
                            sotien2.text.toString(),
                          );
                          setData(myData);
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => HomeLoginScreen()),
                              (Route<dynamic> route) => false);
                        },
                        child: Text(
                          "Cập nhật thông tin",
                          style: TextStyle(color: Colors.black),
                        )),
                    SizedBox(
                      height: 14,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TextForms extends StatefulWidget {
  const TextForms({super.key, required this.controller, required this.label});

  final TextEditingController controller;
  final String label;

  @override
  State<TextForms> createState() => _TextFormsState();
}

class _TextFormsState extends State<TextForms> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          border:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          hintText: '',
          labelStyle: TextStyle(color: Colors.white, fontSize: 13),
          labelText: widget.label),
    );
  }
}
