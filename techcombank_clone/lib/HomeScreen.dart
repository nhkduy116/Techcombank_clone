// ignore_for_file: prefer_const_constructors, file_names, no_leading_underscores_for_local_identifiers, unused_local_variable, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, unused_import, unnecessary_import, unnecessary_new, unnecessary_null_comparison, prefer_typing_uninitialized_variables, unused_field, implementation_imports, prefer_interpolation_to_compose_strings, unrelated_type_equality_checks

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techcombank_clone/CardAccountScreen.dart';
import 'package:techcombank_clone/DataAcc.dart';
import 'package:techcombank_clone/ManageDetailAcc.dart';
import 'package:techcombank_clone/barClick.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String soDu;
  late String ngayChuyen1, nguoiChuyen1, noiDung1, soTien1;
  late String ngayChuyen2, nguoiChuyen2, noiDung2, soTien2;
  void loadData() async {
    final pref = await SharedPreferences.getInstance();
    setState(() {
      soDu = pref.getString("money") ?? "";

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
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    MyData dataAcc = MyData();
    loadData();
    return Scaffold(
        body: Container(
      width: _width,
      height: _height,
      // padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/bg.jpg"), fit: BoxFit.cover),
      ),
      child: SingleChildScrollView(
          child: Stack(children: <Widget>[
        Container(
          color: Colors.transparent,
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 50),
                child: GestureDetector(
                  child: Container(
                      width: 50,
                      height: 50,
                      child: Image(image: AssetImage("assets/menu.png"))),
                ),
              ),
              SizedBox(
                height: 268,
              ),
              BarClick(width: _width, check: false),
              SizedBox(
                height: 30,
              ),
              Container(
                width: _width,
                height: 220,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  children: <Widget>[
                    Expanded(
                        flex: 3,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                width: _width * 0.7,
                                padding: EdgeInsets.symmetric(vertical: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Text(
                                      "Kích hoạt thành công tài khoản TCBS",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                    Text(
                                      "Hôm nay",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff626262)),
                                    ),
                                    Text(
                                      "Tài khoản Techcom Securities của bạn đã sẵn sàng. Bạn có thể bắt đầu giao dịch đầu tiên của mình trên ứng dụng Techcombank",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff626262)),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 32),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      "assets/confirm.jpg",
                                      width: 23,
                                      height: 23,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: Container(
                          width: _width,
                          height: _height,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                              color: Color(0xffF2F2F2),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20))),
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
                                    Text(
                                      "Thông báo",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff626262)),
                                    ),
                                  ],
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: Color(0xff626262),
                              )
                            ],
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: false,
                  pageSnapping: false,
                  height: 120,
                  aspectRatio: 3,
                  clipBehavior: Clip.none,
                  viewportFraction: 0.95,
                  enlargeCenterPage: false,
                  enableInfiniteScroll: false,
                  pauseAutoPlayInFiniteScroll: true,
                  padEnds: false,
                ),
                items: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color(0xffE8E2D4),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.black54,
                            blurRadius: 8.0,
                            offset: Offset(0.0, 0.5))
                      ],
                    ),
                    margin: EdgeInsets.only(right: 20),
                    width: _width * 0.9,
                    padding: EdgeInsets.only(
                        left: 20, right: 10, bottom: 10, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: _width * 0.46,
                          height: _height,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: _width * 0.5,
                                child: Text(
                                  "Ưu đãi lãi suất tiền gửi tiết kiệm online lên đến 8.7%/năm",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Gửi tiết kiệm ngay",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    size: 18,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: _width * 0.27,
                          height: _height,
                          child: Image.asset(
                            "assets/sale.jpg",
                            fit: BoxFit.fill,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color(0xffE8E2D4),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.black54,
                            blurRadius: 8.0,
                            offset: Offset(0.0, 0.5))
                      ],
                    ),
                    margin: EdgeInsets.only(right: 20),
                    width: _width * 0.9,
                    padding: EdgeInsets.only(
                        left: 20, right: 10, bottom: 10, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: _width * 0.46,
                          height: _height,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: _width * 0.5,
                                child: Text(
                                  "Ưu đãi lãi suất tiền gửi tiết kiệm online lên đến 8.7%/năm",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Gửi tiết kiệm ngay",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    size: 18,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: _width * 0.27,
                          height: _height,
                          child: Image.asset(
                            "assets/sale.jpg",
                            fit: BoxFit.fill,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: _width,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hoạt động gần đây",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Xem biến động số dư",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff3E86E4)),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: _width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        child: Image.asset("assets/nhan.png")),
                                  ],
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: _width * 0.71,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: 0.7,
                                              color: Colors.black12))),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 65,
                                        // width: _width*0.4,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              nguoiChuyen1,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              noiDung1,
                                              style: TextStyle(
                                                  fontSize: 12.5,
                                                  color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: 65,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              soTien1,
                                              style: TextStyle(
                                                  color: Color(0xff20825B),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          (ngayChuyen2 == "")
                              ? SizedBox(
                                  height: 20,
                                )
                              : Container(
                                  child: Column(children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    ngayChuyen2,
                                    style: TextStyle(
                                        color: Color(0xff868686),
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
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
                                        child: Image.asset("assets/nhan.png")),
                                  ],
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: _width * 0.71,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: 0.7,
                                              color: Colors.black12))),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 1),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 65,
                                          // width: _width*0.4,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                nguoiChuyen2,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                noiDung2,
                                                style: TextStyle(
                                                    fontSize: 12.5,
                                                    color: Colors.grey),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: 65,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                soTien2,
                                                style: TextStyle(
                                                    color: Color(0xff20825B),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
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
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        Positioned(
            right: 0,
            top: 120,
            child: Container(
              width: _width * 0.5,
              height: 75,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                  color: Colors.white),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 3,
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
                              style: TextStyle(
                                  fontSize: 12, color: Color(0xff646464)),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(soDu, style: TextStyle(fontSize: 16.5))
                          ],
                        ),
                      ))
                ],
              ),
            ))
      ])),
    ));
  }
}
