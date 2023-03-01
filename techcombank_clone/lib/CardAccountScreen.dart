// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardAccountScreen extends StatelessWidget {
  const CardAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    // double _width = MediaQuery
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: null),
//        backgroundColor: Colors.transparent,
          title: Center(
            child:
                Text("Tài khoản & thẻ", style: TextStyle(color: Colors.black)),
          ),
          backgroundColor: Color(0xFFFFFFFF),
          elevation: 0,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.black,
              ),
              onPressed: null,
            ),
          ],
        ),
        // extendBodyBehindAppBar: true,
        body: Container(
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg.jpg"), fit: BoxFit.fill),
          ),
          child: Container(
            child: DefaultTabController(
              length: 5,
              child: Column(
                children: <Widget>[
                  Container(
                    height: 70,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    color: Colors.white,
                    child: ButtonsTabBar(
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      backgroundColor: Colors.black,
                      unselectedBackgroundColor: Colors.white,
                      unselectedLabelStyle: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      labelStyle: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      unselectedBorderColor: Colors.black,
                      radius: 100,
                      borderWidth: 1,
                      tabs: [
                        Tab(
                          text: "Tài khoản",
                        ),
                        Tab(
                          text: "Thẻ tín dụng",
                        ),
                        Tab(
                          text: "Tiết kiệm & đầu tư",
                        ),
                        Tab(
                          text: "Vay",
                        ),
                        Tab(
                          text: "Bảo hiểm",
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: <Widget>[
                        Container(
                            child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              margin: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 20),
                              padding: EdgeInsets.symmetric(
                                  vertical: 30, horizontal: 20),
                              width: _width,
                              height: 150,
                              child: Column(
                                children: [
                                  Container(
                                    child: Row(children: [
                                      Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          width: 30,
                                          child: Image.asset(
                                              'assets/wallet3.jpg')),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Text(
                                                  "Tài khoản thanh toán",
                                                ),
                                              ),
                                              Container(
                                                child: Text(
                                                  "Số tài khoản",
                                                ),
                                              )
                                            ]),
                                      )
                                    ]),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 0, vertical: 15),
                                    child:
                                        Divider(color: Colors.black, height: 2),
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text("VND "),
                                        Text("1,230,000"),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 40,
                              child: Text(
                                "Xem tài khoản lưu trữ",
                                style: TextStyle(color: Colors.blue),
                              ),
                            )
                          ],
                        )),
                        Center(
                          child: Icon(Icons.directions_transit),
                        ),
                        Center(
                          child: Icon(Icons.directions_bike),
                        ),
                        Center(
                          child: Icon(Icons.directions_car),
                        ),
                        Center(
                          child: Icon(Icons.directions_transit),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
