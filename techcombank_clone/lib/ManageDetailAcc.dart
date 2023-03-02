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
      body: SingleChildScrollView(
        child: Container(
          width: _width,
          height: _height,
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/bg.jpg"), fit: BoxFit.cover),
          ),
          child: Column(
            children: <Widget>[
              Form(
                key: _formKey,
                child: Container(
                  width: _width,
                  height: _height,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 20,),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: userAcc,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white
                            )
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white
                            )
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)
                          ),
                          hintText: '',
                          labelStyle: TextStyle(color: Colors.white, fontSize: 13),
                          hintStyle:
                              TextStyle(color: Colors.white),
                          labelText: 'Tên tài khoản (In hoa không dấu)'),
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        controller: money,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white
                            )
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white
                            )
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)
                          ),
                          hintText: '',
                          labelStyle: TextStyle(color: Colors.white,  fontSize: 13),
                          hintStyle:
                              TextStyle(color: Colors.white),
                          labelText: 'Số tiền (Thêm dấu , ngăn cách đơn vị nghìn, triệu, ...)'),
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        controller: numberAcc,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white
                            )
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white
                            )
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)
                          ),
                          hintText: '',
                          labelStyle: TextStyle(color: Colors.white, fontSize: 13),
                          hintStyle:
                              TextStyle(color: Colors.white),
                          labelText: 'Số tài khoản (Thêm dấu cách cho đúng STK Tech)'),
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        controller: lastNum,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white
                            )
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white
                            )
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)
                          ),
                          hintText: '',
                          labelStyle: TextStyle(color: Colors.white, fontSize: 13),
                          hintStyle:
                              TextStyle(color: Colors.white),
                          labelText: 'Đuôi SĐT'),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                        ),
                        onPressed: () {
                          Provider.of<MyData>(context, listen: false).incrementDetail(money.text.toString(), userAcc.text.toString(), numberAcc.text.toString(), lastNum.text.toString());
                          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                          HomeLoginScreen()), (Route<dynamic> route) => false);
                        },
                        child: Text("Cập nhật thông tin", style: TextStyle(color: Colors.black),)
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}