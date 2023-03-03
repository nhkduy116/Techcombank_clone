// ignore_for_file: prefer_const_constructors, file_names, no_leading_underscores_for_local_identifiers, unused_local_variable, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, unused_import, unnecessary_import, unnecessary_new, unnecessary_null_comparison, prefer_typing_uninitialized_variables, unused_field, implementation_imports

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:techcombank_clone/CardAccountScreen.dart';
import 'package:techcombank_clone/DataAcc.dart';
import 'package:techcombank_clone/ManageDetailAcc.dart';

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
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => ManageDetailAcc()),
                      (Route<dynamic> route) => false);
                },
                child: Image.asset("assets/menu.jpg")),
          ),
        ),
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
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          CardAccountScreen())));
                            },
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
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                            flex: 3,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    width: _width * 0.7,
                                    padding: EdgeInsets.symmetric(vertical: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                    height: 420,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hoạt động gần đây",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
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
                          height: 120,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Consumer<MyData>(
                                  builder: (context, myData, child) {
                                return Text(
                                  myData.date1.toString(),
                                  style: TextStyle(
                                      color: Color(0xff868686),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                );
                              }),
                              Container(
                                width: _width,
                                height: 65,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: _width * 0.08,
                                    ),
                                    Container(
                                      width: _width * 0.735,
                                      height: 65,
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  width: 1,
                                                  color: Color(0xffCCCCCC)))),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: 65,
                                            width: _width*0.4,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Consumer<MyData>(builder:
                                                    (context, myData, child) {
                                                  return Text(
                                                    myData.nguoichuyen1
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  );
                                                }),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Consumer<MyData>(builder:
                                                    (context, myData, child) {
                                                  return Text(
                                                    myData.noidung1.toString(),
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  );
                                                }),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: 105,
                                            height: 65,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Consumer<MyData>(builder:
                                                    (context, myData, child) {
                                                  return Text(
                                                    myData.sotien1.toString(),
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff868686),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  );
                                                })
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
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: _width,
                          height: 120,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Consumer<MyData>(
                                  builder: (context, myData, child) {
                                return Text(
                                  myData.date2.toString(),
                                  style: TextStyle(
                                      color: Color(0xff868686),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                );
                              }),
                              Container(
                                width: _width,
                                height: 65,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: _width * 0.08,
                                    ),
                                    Container(
                                      width: _width * 0.735,
                                      height: 65,
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  width: 1,
                                                  color: Color(0xffCCCCCC)))),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: 65,
                                            width: _width*0.4,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Consumer<MyData>(builder:
                                                    (context, myData, child) {
                                                  return Text(
                                                    myData.nguoichuyen2
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  );
                                                }),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Consumer<MyData>(builder:
                                                    (context, myData, child) {
                                                  return Text(
                                                    myData.noidung2.toString(),
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  );
                                                }),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: _width*0.3,
                                            height: 65,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Consumer<MyData>(builder:
                                                    (context, myData, child) {
                                                  return Text(
                                                    myData.sotien2.toString(),
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff868686),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  );
                                                })
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
                                  style: TextStyle(color: Color(0xff646464)),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Consumer<MyData>(
                                  builder: (context, myData, child) {
                                    return Text(
                                      myData.money.toString(),
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    );
                                  },
                                )
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

class ContainerCom extends StatelessWidget {
  const ContainerCom(
      {super.key,
      required this.ngay,
      required this.nguoichuyen,
      required this.noidung,
      required this.sotien});

  final String ngay, nguoichuyen, noidung, sotien;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Container(
      width: _width,
      height: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            ngay,
            style: TextStyle(
                color: Color(0xff868686),
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
          Container(
            width: _width,
            height: 65,
            child: Row(
              children: [
                SizedBox(
                  width: _width * 0.08,
                ),
                Container(
                  width: _width * 0.735,
                  height: 65,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(width: 1, color: Color(0xffCCCCCC)))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 65,
                        width: 180,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              nguoichuyen,
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              noidung,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: _width*0.3,
                        height: 65,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              sotien,
                              style: TextStyle(
                                  color: Color(0xff868686),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
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
    );
  }
}
