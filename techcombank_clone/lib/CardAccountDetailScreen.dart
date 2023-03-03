// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, prefer_interpolation_to_compose_strings

import 'dart:math';

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:techcombank_clone/DataAcc.dart';

class CardAccountDetailScreen extends StatelessWidget {
  const CardAccountDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    // double _width = MediaQuery
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
                  margin: EdgeInsets.only(top: 25, right: 50, left: 50),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  child: Image(
                    image: AssetImage('assets/ic_card_debit.png'),
                  ),
                ),
              ),

              // Bắt dầu di được
              // tổng bao

              Container(
                margin: EdgeInsets.only(top: 111),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Consumer<MyData>(
                                    builder: (context, myData, child) {
                                  return Text(
                                    myData.name.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  );
                                }),
                                Container(
                                    child: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 10),
                                      child: Consumer<MyData>(
                                          builder: (context, myData, child) {
                                        return Text(
                                          myData.lastNumberPhone.toString(),
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        );
                                      }),
                                    ),
                                    Icon(Icons.remove_red_eye_outlined)
                                  ],
                                )),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            padding:
                                EdgeInsets.only(left: 20, bottom: 20, top: 20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                )),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      margin: EdgeInsets.only(bottom: 15),
                                      child: Text(
                                        "Số dư",
                                      )),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 25),
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(right: 8),
                                          child: Text(
                                            "VND",
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black38,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Consumer<MyData>(
                                            builder: ((context, myData, child) {
                                          return Text(
                                            myData.money.toString(),
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          );
                                        }))
                                      ],
                                    ),
                                  ),
                                  Text("Số tài khoản"),
                                  Row(
                                    children: [
                                      Consumer<MyData>(
                                          builder: (context, myData, child) {
                                        return Text(
                                          myData.numberAcc.toString(),
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        );
                                      }),
                                      Container(
                                          margin: EdgeInsets.only(
                                              bottom: 8, left: 10),
                                          width: 30,
                                          height: 30,
                                          child:
                                              Image.asset("assets/share.jpg"))
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
                                horizontal: 10, vertical: 15),
                            child: Container(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    GestureDetector(
                                      child: Container(
                                        width: 80,
                                        height: 60,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                                width: _width * 0.07,
                                                child: Image.asset(
                                                    "assets/change.jpg")),
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
                                    ),
                                    GestureDetector(
                                      child: Container(
                                        width: 80,
                                        height: 60,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                                width: _width * 0.07,
                                                child: Image.asset(
                                                    "assets/wallet2.jpg")),
                                            Container(
                                                width: _width * 0.3,
                                                alignment: Alignment.center,
                                                child: Text(
                                                  'Quản lý tài khoản',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(fontSize: 12),
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 2,
                                                ))
                                          ],
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      child: Container(
                                        width: 80,
                                        height: 60,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                                width: _width * 0.07,
                                                child: Image.asset(
                                                    "assets/card.jpg")),
                                            Container(
                                                width: _width * 0.17,
                                                alignment: Alignment.center,
                                                child: Text(
                                                  'Quản lý thẻ',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(fontSize: 12),
                                                  overflow: TextOverflow.ellipsis,
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
                            margin:
                                EdgeInsets.only(left: 20, top: 10, right: 20),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Lịch sử giao dịch",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Icon(
                                    Icons.search,
                                  )
                                ]),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: 20, right: 20, top: 20, bottom: 20),
                            child: Divider(
                              color: Colors.black26,
                              height: 5,
                            ),
                          ),
                          Container(
                            child: Column(children: [
                              Container(
                                  margin: EdgeInsets.only(left: 20, bottom: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Consumer<MyData>(builder: (context, myData, child) {
                                        return Text(myData.date2.toString());
                                      }),
                                    ],
                                  )),
                              Container(
                                child: Column(
                                  children: [
                                    Container(
                                      child: Column(
                                        children: [
                                          Row(children: [
                                            Container(
                                                width: 30,
                                                height: 30,
                                                margin: EdgeInsets.only(
                                                    bottom: 25,
                                                    left: 20,
                                                    right: 10),
                                                child: Image.asset(
                                                    "assets/next.jpg")),
                                            Container(
                                              width: _width * 0.8,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Consumer<MyData>(builder: (context, myData, child){
                                                        return Text(
                                                        myData.nguoichuyen2.toString(),
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      );
                                                      }),
                                                      Consumer<MyData>(builder: (context, myData, child){
                                                        return Text(
                                                        "+ "+myData.sotien2.toString(),
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: Color(0xff378152),
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      );
                                                      }),
                                                    ],
                                                  ),
                                                  Container(
                                                      margin: EdgeInsets.only(
                                                          top: 10),
                                                      child: Consumer<MyData>(builder: (context, myData, child){
                                                        return Text(
                                                        myData.noidung2.toString(),
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black38,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal),
                                                      );
                                                      })),
                                                ],
                                              ),
                                            ),
                                          ]),
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 20,
                                                left: 60,
                                                right: 22,
                                                bottom: 20),
                                            child: Divider(
                                              color: Colors.black38,
                                              height: 2,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ]),
                          ),
                          Container(
                            child: Column(children: [
                              Container(
                                  margin: EdgeInsets.only(left: 20, bottom: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Consumer<MyData>(builder: (context, myData, child) {
                                        return Text(myData.date1.toString());
                                      }),
                                    ],
                                  )),
                              Container(
                                child: Column(
                                  children: [
                                    Container(
                                      child: Column(
                                        children: [
                                          Row(children: [
                                            Container(
                                                width: 30,
                                                height: 30,
                                                margin: EdgeInsets.only(
                                                    bottom: 25,
                                                    left: 20,
                                                    right: 10),
                                                child: Image.asset(
                                                    "assets/next.jpg")),
                                            Container(
                                              width: _width * 0.8,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Consumer<MyData>(builder: (context, myData, child){
                                                        return Text(
                                                        myData.nguoichuyen1.toString(),
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      );
                                                      }),
                                                      Consumer<MyData>(builder: (context, myData, child){
                                                        return Text(
                                                        "+ "+myData.sotien1.toString(),
                                                        style: TextStyle(
                                                          color: Color(0xff378152),
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      );
                                                      }),
                                                    ],
                                                  ),
                                                  Container(
                                                      margin: EdgeInsets.only(
                                                          top: 10),
                                                      child: Consumer<MyData>(builder: (context, myData, child){
                                                        return Text(
                                                        myData.noidung1.toString(),
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black38,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal),
                                                      );
                                                      })),
                                                ],
                                              ),
                                            ),
                                          ]),
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 20,
                                                left: 60,
                                                right: 22,
                                                bottom: 20),
                                            child: Divider(
                                              color: Colors.black38,
                                              height: 2,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ]),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
