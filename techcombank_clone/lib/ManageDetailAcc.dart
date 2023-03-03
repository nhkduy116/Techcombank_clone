// ignore_for_file: prefer_const_constructors, file_names, no_leading_underscores_for_local_identifiers, unused_local_variable, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, unused_import, unnecessary_import, unnecessary_new, unnecessary_null_comparison, prefer_typing_uninitialized_variables, unused_field, implementation_imports, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:techcombank_clone/DataAcc.dart';
import 'package:techcombank_clone/HomeLoginScreen.dart';

class ManageDetailAcc extends StatefulWidget {
  const ManageDetailAcc({super.key});

  @override
  State<ManageDetailAcc> createState() => _ManageDetailAccState();
}

class _ManageDetailAccState extends State<ManageDetailAcc> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController userAcc = new TextEditingController();
  final TextEditingController money = new TextEditingController();
  final TextEditingController numberAcc = new TextEditingController();
  final TextEditingController lastNum = new TextEditingController();
  final TextEditingController nguoichuyen1 = new TextEditingController();
  final TextEditingController nguoichuyen2 = new TextEditingController();
  final TextEditingController noidung1 = new TextEditingController();
  final TextEditingController noidung2 = new TextEditingController();
  final TextEditingController date1 = new TextEditingController();
  final TextEditingController date2 = new TextEditingController();
  final TextEditingController sotien1 = new TextEditingController();
  final TextEditingController sotien2 = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffBA2F32),
        title: Text("Manage Detail Account"),
        elevation: 0,
      ),
      body: Container(
        width: _width,
        height: _height,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/bg.jpg"), fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                TextForms(
                    controller: userAcc,
                    label: 'Tên tài khoản (In hoa không dấu)'),
                SizedBox(
                  height: 20,
                ),
                TextForms(
                    controller: money,
                    label:
                        'Số tiền (Thêm dấu , ngăn cách đơn vị nghìn, triệu, ...)'),
                SizedBox(
                  height: 20,
                ),
                TextForms(
                    controller: numberAcc,
                    label:
                        'Số tài khoản (Thêm dấu cách cho đúng STK Tech)'),
                SizedBox(
                  height: 20,
                ),
                TextForms(controller: date1, label: "Ngày thêm 1 (eg: 26 Thg 2, 2023)"),
                SizedBox(
                  height: 30,
                ),
                TextForms(controller: nguoichuyen1, label: "Người chuyển 1 (In hoa không dấu)"),
                SizedBox(
                  height: 30,
                ),
                TextForms(controller: noidung1, label: "Nội dung 1"),
                SizedBox(
                  height: 30,
                ),
                TextForms(controller: sotien1, label: "Số tiền 1 (eg: + 1,000,000)"),
                SizedBox(
                  height: 30,
                ),
                TextForms(controller: date2, label: "Ngày thêm 2 (eg: 26 Thg 2, 2023)"),
                SizedBox(
                  height: 30,
                ),
                TextForms(controller: nguoichuyen2, label: "Người chuyển 1 (In hoa không dấu)"),
                SizedBox(
                  height: 30,
                ),
                TextForms(controller: noidung2, label: "Nội dung 1"),
                SizedBox(
                  height: 30,
                ),
                TextForms(controller: sotien2, label: "Số tiền 1 (eg: + 1,000,000)"),
                SizedBox(
                  height: 30,
                ),
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20))),
                    ),
                    onPressed: () {
                      Provider.of<MyData>(context, listen: false)
                          .incrementDetail(
                              money.text.toString(),
                              userAcc.text.toString(),
                              numberAcc.text.toString(),
                              lastNum.text.toString(),
                              nguoichuyen1.text.toString(),
                              nguoichuyen2.text.toString(),
                              noidung1.text.toString(),
                              noidung2.text.toString(),
                              date1.text.toString(),
                              date2.text.toString(),
                              sotien1.text.toString(),
                              sotien2.text.toString(),
                            );
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => HomeLoginScreen()),
                          (Route<dynamic> route) => false);
                    },
                    child: Text(
                      "Cập nhật thông tin",
                      style: TextStyle(color: Colors.black),
                    ))
              ],
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
          hintStyle: TextStyle(color: Colors.white),
          labelText: widget.label),
    );
  }
}
