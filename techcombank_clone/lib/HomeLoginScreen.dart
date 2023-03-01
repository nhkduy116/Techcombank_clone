// ignore_for_file: prefer_const_constructors, file_names, no_leading_underscores_for_local_identifiers, unused_local_variable, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

class HomeLoginScreen extends StatelessWidget {
  const HomeLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffBA2F32),
        elevation: 0,
      ),
      body: Container(
        width: _width,
        height: _height,
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/bg.jpg"), fit: BoxFit.cover),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Chào buổi sáng,",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    "LE TAN CUONG",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              child: Container(
                  alignment: Alignment.center,
                  width: 120,
                  height: 40,
                  child: Text(
                    "Đăng nhập",
                    style: TextStyle(color: Colors.black),
                  )),
            ),
            SizedBox(
              height: 120,
            ),
            Container(
              width: _width,
              height: 95,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
              ),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              width: _width * 0.07,
                              child: Image.asset("assets/wallet.jpg")),
                          Container(
                              width: _width * 0.17,
                              // height: 5,
                              alignment: Alignment.center,
                              child: Text(
                                'Tài khoản & Thẻ',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 12),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ))
                        ],
                      ),
                    ),
                    GestureDetector(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              width: _width * 0.07,
                              child: Image.asset("assets/change.jpg")),
                          Container(
                              width: _width * 0.17,
                              alignment: Alignment.center,
                              child: Text(
                                'Chuyển tiền & thanh toán',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 12),overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ))
                        ],
                      ),
                    ),
                    GestureDetector(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              width: _width * 0.07,
                              child: Image.asset("assets/qrcode.jpg")),
                          Container(
                              width: _width * 0.17,
                              alignment: Alignment.center,
                              child: Text(
                                'Quét mã QR',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 12),overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ))
                        ],
                      ),
                    ),
                    GestureDetector(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              width: _width * 0.07, child: Image.asset("assets/pay.jpg")),
                          Container(
                              width: _width * 0.17,
                              alignment: Alignment.center,
                              child: Text(
                                'Rút tiền không thẻ',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 12),overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ))
                        ],
                      ),
                    ),
                    GestureDetector(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              width: _width * 0.07, child: Image.asset("assets/home.jpg")),
                          Container(
                              width: _width * 0.17,
                              alignment: Alignment.center,
                              child: Text(
                                'Khám phá sản phẩm',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 12),overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ))
                        ],
                      ),
                    ),
                  ]),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: _width,
              height: 87*3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      width: _width,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Center(
                              child: Container(
                                width: 30,
                                child: Image.asset("assets/book.jpg")
                              ),
                            )
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            flex: 7,
                            child: Container(
                              height: _height,
                              decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(width: 1))       
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('Hướng dẫn sử dụng', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                                  Icon(Icons.keyboard_arrow_right)
                                ],
                              ),
                            )
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      width: _width,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Center(
                              child: Container(
                                width: 30,
                                child: Image.asset("assets/warning.jpg")
                              ),
                            )
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            flex: 7,
                            child: Container(
                              height: _height,
                              decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(width: 1))       
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('Hướng dẫn bảo mật', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                                  Icon(Icons.keyboard_arrow_right)
                                ],
                              ),
                            )
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      width: _width,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Center(
                              child: Container(
                                width: 30,
                                child: Image.asset("assets/phone.jpg")
                              ),
                            )
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            flex: 7,
                            child: Container(
                              height: _height,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('Liên hệ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                                  Icon(Icons.keyboard_arrow_right)
                                ],
                              ),
                            )
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
