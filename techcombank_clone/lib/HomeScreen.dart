// ignore_for_file: prefer_const_constructors, file_names, no_leading_underscores_for_local_identifiers, unused_local_variable, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, unused_import, unnecessary_import, unnecessary_new, unnecessary_null_comparison, prefer_typing_uninitialized_variables, unused_field, implementation_imports

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffBA2F32),
          elevation: 0,
          leadingWidth: 75,
          leading: Container(
            margin: EdgeInsets.only(left: 20),
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)))),
                onPressed: () {},
                child: Image.asset("assets/menu.jpg")),
          ),
        ),
        body: SingleChildScrollView(
            child: Stack(children: <Widget>[
          Container(
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
                  height: 300,
                ),
                Container(
                  width: _width,
                  height: 95,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
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
                                  child: Image.asset("assets/qrcode.jpg")),
                              Container(
                                  width: _width * 0.17,
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Quét mã QR',
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
                                  child: Image.asset("assets/pay.jpg")),
                              Container(
                                  width: _width * 0.17,
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Rút tiền không thẻ',
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
                                  child: Image.asset("assets/home.jpg")),
                              Container(
                                  width: _width * 0.17,
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Khám phá sản phẩm',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 12),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ))
                            ],
                          ),
                        ),
                      ]),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: _width,
                  height: 220,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(width: _width*0.7,
                                padding: EdgeInsets.symmetric(vertical: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Text("Kích hoạt thành công tài khoản TCBS", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700), overflow: TextOverflow.ellipsis, maxLines: 1,),
                                    Text("Hôm nay", style: TextStyle(fontSize: 14, color: Color(0xff626262)),),
                                    Text("Tài khoản Techcom Securities của bạn đã sẵn sàng. Bạn có thể bắt đầu giao dịch đầu tiên của mình trên ứng dụng Techcombank", style: TextStyle(fontSize: 14, color: Color(0xff626262)), overflow: TextOverflow.ellipsis, maxLines: 2,),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 32),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset("assets/confirm.jpg", width: 23,height: 23,)
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          width: _width,
                          height: _height,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: Color(0xffF2F2F2),
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                width: 150,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 37,
                                      child: Image.asset('assets/noti.jpg'),
                                    ),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    Text("Thông báo", style: TextStyle(fontSize: 14, color: Color(0xff626262)),),
                                  ],
                                ),
                              ),
                              Icon(Icons.arrow_forward_ios, size: 16,color: Color(0xff626262),)
                            ],
                          ),
                        )
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              right: 0,
              top: 30,
              child: Container(
                width: _width * 0.5,
                height: 75,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20)),
                    color: Colors.white),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 7,
                    ),
                    Expanded(
                        flex: 1,
                        child: Container(
                            width: 10,
                            // color: Colors.yellow,
                            child: Image.asset(
                              "assets/logo.jpg",
                              width: 5,
                              height: 18,
                            ))),
                    Expanded(
                        flex: 3,
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Tài khoản thanh toán",
                                style: TextStyle(color: Color(0xff646464)),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "354,604",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              ))
        ])));
  }
}
