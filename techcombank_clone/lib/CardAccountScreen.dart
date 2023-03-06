// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, no_leading_underscores_for_local_identifiers

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techcombank_clone/CardAccountDetailScreen.dart';
import 'package:techcombank_clone/DataAcc.dart';

class CardAccountScreen extends StatefulWidget {
  const CardAccountScreen({super.key});

  @override
  State<CardAccountScreen> createState() => _CardAccountScreen();
}

class _CardAccountScreen extends State<CardAccountScreen> {
  late String soDu, soTaiKhoan;
  void loadData() async {
    final pref = await SharedPreferences.getInstance();
    setState(() {
      soDu = pref.getString("money") ?? "";
      soTaiKhoan = pref.getString("numberAcc") ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    loadData();
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    MyData dataAcc = MyData();
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
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
                    height: 65,
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
                      unselectedBorderColor: Colors.grey.shade300,
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
                      physics: NeverScrollableScrollPhysics(),
                      children: <Widget>[
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        CardAccountDetailScreen()));
                              },
                              child: Container(
                                  child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    margin: EdgeInsets.symmetric(
                                        vertical: 16, horizontal: 16),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 20),
                                    width: _width,
                                    height: 140,
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
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 16),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Container(
                                                      child: Text(
                                                        soTaiKhoan,
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color: Color(
                                                                0xff757575)),
                                                      ),
                                                    ),
                                                  ]),
                                            )
                                          ]),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 0, vertical: 12),
                                          child: Divider(
                                              color: Colors.black45, height: 4),
                                        ),
                                        Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                "VND ",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.grey),
                                              ),
                                              Text(soDu,
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold))
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 17),
                              height: 40,
                              child: Text(
                                "Xem tài khoản lưu trữ",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
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
