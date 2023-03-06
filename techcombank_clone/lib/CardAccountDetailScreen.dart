// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, prefer_interpolation_to_compose_strings, must_be_immutable

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techcombank_clone/DataAcc.dart';

class CardAccountDetailScreen extends StatefulWidget {
  const CardAccountDetailScreen({super.key});

  @override
  State<CardAccountDetailScreen> createState() => _CardAccountDetailScreen();
}

class _CardAccountDetailScreen extends State<CardAccountDetailScreen> {
  late String nameAcc;
  late String soThe, soDu, soTaiKhoan;
  late String ngayChuyen1, nguoiChuyen1, noiDung1, soTien1;
  late String ngayChuyen2, nguoiChuyen2, noiDung2, soTien2;
  void loadData() async {
    final pref = await SharedPreferences.getInstance();
    setState(() {
      nameAcc = pref.getString("name") ?? "";
      soThe = pref.getString("soThe") ?? "";
      soDu = pref.getString("money") ?? "";
      soTaiKhoan = pref.getString("numberAcc") ?? "";

      ngayChuyen1 = pref.getString("date1") ?? "";
      nguoiChuyen1 = pref.getString("nguoichuyen1") ?? "";
      noiDung1 = pref.getString("noidung1") ?? "";
      soTien1 = pref.getString("sotien1") ?? "";

      ngayChuyen2 = pref.getString("date2") ?? "";
      nguoiChuyen2 = pref.getString("nguoichuyen2") ?? "";
      noiDung2 = pref.getString("noidung2") ?? "";
      soTien2 = pref.getString("sotien2") ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    loadData();
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    // double _width = MediaQuery
    MyData dataAcc = MyData();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
//        backgroundColor: Colors.transparent,
        title: Center(
          child: Text("Tài khoản thanh toán",
              style: TextStyle(color: Colors.white)),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(null),
            onPressed: null,
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(top: 80),
        width: _width,
        height: _height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/bg.jpg"), fit: BoxFit.fill),
        ),
        child: SingleChildScrollView(
          child: Container(
            child: Stack(alignment: Alignment.topCenter, children: [
              Container(
                child: Container(
                  margin: EdgeInsets.only(top: 22, right: 47, left: 47),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  child: Image(
                    image: AssetImage('assets/ic_card_debit.png'),
                  ),
                ),
              ),

              // Bắt dầu di được
              // tổng bao
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 125),
                    child: Column(
                      children: [
                        // layout1
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 9),
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.9),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    )),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      nameAcc,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.5),
                                    ),
                                    Container(
                                        child: Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(right: 10),
                                          child: Text(
                                            "••• " + soThe,
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Icon(Icons.remove_red_eye_outlined)
                                      ],
                                    )),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 15),
                                padding: EdgeInsets.only(left: 20, top: 20),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                    )),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          margin: EdgeInsets.only(bottom: 15),
                                          child: Text("Số dư",
                                              style: TextStyle(
                                                fontSize: 13.5,
                                              ))),
                                      Container(
                                        margin: EdgeInsets.only(bottom: 25),
                                        child: Row(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(right: 8),
                                              child: Text(
                                                "VND",
                                                style: TextStyle(
                                                    fontSize: 21,
                                                    color: Colors.black38,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Text(
                                              soDu,
                                              style: TextStyle(
                                                  fontSize: 21,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                      ),
                                      Text(
                                        "Số tài khoản",
                                        style: TextStyle(fontSize: 13.5),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            soTaiKhoan,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                              margin: EdgeInsets.only(
                                                  bottom: 8, left: 10),
                                              width: 30,
                                              height: 30,
                                              child: Image.asset(
                                                  "assets/share.jpg"))
                                        ],
                                      )
                                    ]),
                              ),
                            ],
                          ),
                        ),
                        // layout2
                        Container(
                          width: _width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              )),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 15),
                                width: _width,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 4,
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(10)),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 16),
                                child: Container(
                                  padding: EdgeInsets.all(2),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        GestureDetector(
                                          child: Container(
                                            width: 100,
                                            height: 70,
                                            child: Column(
                                              children: [
                                                Container(
                                                    width: _width * 0.08,
                                                    padding: EdgeInsets.only(
                                                        bottom: 8),
                                                    child: Image.asset(
                                                        "assets/change2.jpg")),
                                                Container(
                                                    width: _width * 0.3,
                                                    alignment:
                                                        Alignment.topCenter,
                                                    child: Text(
                                                      'Chuyển tiền & thanh toán',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 2,
                                                    ))
                                              ],
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          child: Container(
                                            width: 100,
                                            height: 70,
                                            child: Column(
                                              children: [
                                                Container(
                                                    padding: EdgeInsets.only(
                                                        bottom: 8),
                                                    width: _width * 0.08,
                                                    child: Image.asset(
                                                        "assets/wallet2.jpg")),
                                                Container(
                                                    width: _width * 0.3,
                                                    alignment:
                                                        Alignment.topCenter,
                                                    child: Text(
                                                      'Quản lý tài khoản',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 2,
                                                    ))
                                              ],
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          child: Container(
                                            width: 100,
                                            height: 70,
                                            child: Column(
                                              children: [
                                                Container(
                                                    padding: EdgeInsets.only(
                                                        bottom: 8),
                                                    width: _width * 0.08,
                                                    child: Image.asset(
                                                        "assets/card.jpg")),
                                                Container(
                                                    width: _width * 0.3,
                                                    alignment:
                                                        Alignment.topCenter,
                                                    child: Text(
                                                      'Quản lý thẻ',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 2,
                                                    ))
                                              ],
                                            ),
                                          ),
                                        ),
                                      ]),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: 20, top: 8, right: 20),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Lịch sử giao dịch",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      Icon(
                                        Icons.search,
                                      )
                                    ]),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    left: 20, right: 20, top: 20, bottom: 5),
                                child: Divider(
                                  color: Colors.black26,
                                  height: 5,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 22, vertical: 20),
                                child: Column(children: [
                                  Container(
                                    width: _width,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          ngayChuyen1,
                                          style: TextStyle(
                                              color: Color(0xff868686),
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 40,
                                        ),
                                        Container(
                                          width: _width,
                                          height: 65,
                                          child: Row(
                                            children: [
                                              Column(
                                                children: [
                                                  Container(
                                                      width: 23,
                                                      child: Image.asset(
                                                          "assets/nhan.png")),
                                                ],
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Container(
                                                width: _width * 0.78,
                                                height: 65,
                                                decoration: BoxDecoration(
                                                    border: Border(
                                                        bottom: BorderSide(
                                                            width: 0.7,
                                                            color: Colors
                                                                .black12))),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      height: 65,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            nguoiChuyen1,
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                            noiDung1,
                                                            style: TextStyle(
                                                                fontSize: 12.5,
                                                                color: Colors
                                                                    .grey),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 65,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                            soTien1,
                                                            style: TextStyle(
                                                                color: Color(
                                                                    0xff20825B),
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: _width,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            child: Column(children: [
                                          (ngayChuyen2 != "")
                                              ? Container(
                                                  child: Column(children: [
                                                    SizedBox(
                                                      height: 23,
                                                    ),
                                                    Text(
                                                      ngayChuyen2,
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xff868686),
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      height: 40,
                                                    ),
                                                  ]),
                                                )
                                              : SizedBox(
                                                  height: 23,
                                                )
                                        ])),
                                        Container(
                                          width: _width,
                                          height: 65,
                                          child: Row(
                                            children: [
                                              Column(
                                                children: [
                                                  Container(
                                                      width: 23,
                                                      child: Image.asset(
                                                          "assets/nhan.png")),
                                                ],
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Container(
                                                width: _width * 0.78,
                                                height: 65,
                                                decoration: BoxDecoration(
                                                    border: Border(
                                                        bottom: BorderSide(
                                                            width: 0.7,
                                                            color: Colors
                                                                .black12))),
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 1),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                        height: 65,
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              nguoiChuyen2,
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            Text(
                                                              noiDung2,
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      12.5,
                                                                  color: Colors
                                                                      .grey),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 65,
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Text(
                                                              soTien2,
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xff20825B),
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            )
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ]),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
