// ignore_for_file: prefer_const_constructors, file_names, no_leading_underscores_for_local_identifiers, unused_local_variable, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, unused_import, unnecessary_import, unnecessary_new, unnecessary_null_comparison, prefer_typing_uninitialized_variables, unused_field, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techcombank_clone/CardAccountScreen.dart';
import 'package:techcombank_clone/DataAcc.dart';
import 'package:techcombank_clone/HomeScreen.dart';
import 'package:techcombank_clone/ManageDetailAcc.dart';
import 'package:techcombank_clone/barClick.dart';

class HomeLoginScreen extends StatefulWidget {
  const HomeLoginScreen({super.key});

  @override
  State<HomeLoginScreen> createState() => _HomeLoginScreenState();
}

class _HomeLoginScreenState extends State<HomeLoginScreen>
    with TickerProviderStateMixin {
  bool isCompleted = false;
  final TextEditingController _pinPutController = TextEditingController();
  late AnimationController _animationController;
  late Animation<double> _animation;

  String? sangToi = "", nameAcc = "";

  void loadData() async {
    final pref = await SharedPreferences.getInstance();
    setState(() {
      nameAcc = pref.getString("name") ?? "";
      sangToi = pref.getString("sangToi") ?? "";
    });
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 700),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _animationController.forward();
  }

  void setCompleted() {
    setState(() {
      isCompleted = true;
    });
  }

  void setCompletedFalse() {
    setState(() {
      isCompleted = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    loadData();
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    const borderColor = Color.fromRGBO(23, 171, 144, 0.4);
    double textSizeQuetMaQr = 11.7;

    final defaultPinTheme = PinTheme(
      width: 32,
      height: 50,
      margin: EdgeInsets.only(right: 16),
      textStyle: const TextStyle(
        fontSize: 60,
      ),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 2)),
      ),
    );

    final focusPinTheme = defaultPinTheme.copyBorderWith(
        border: Border(bottom: BorderSide(color: Color(0xff3682EC), width: 2)));

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        width: _width,
        height: _height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/bg.jpg"), fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 115,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Consumer<MyData>(builder: (context, myData, child) {
                      String data = myData.sangToi;
                      return Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          "Chào buổi " + sangToi! + ",",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      );
                    }),
                    Container(
                      padding: EdgeInsets.only(top: 2),
                      child: Text(
                        nameAcc!,
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 13,
              ),
              OutlinedButton(
                onPressed: () {
                  showModalBottomSheet(
                      transitionAnimationController: _animationController,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      )),
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return FadeTransition(
                          opacity: _animation,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                              color: Color(0xffFFFFFF),
                            ),
                            height: _height * 0.91,
                            child: Stack(children: <Widget>[
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 25),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Icon(
                                        Icons.close,
                                        color: Colors.grey.shade800,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 40,
                                    ),
                                    Container(
                                      width: 80,
                                      child: Image.asset("assets/logo.jpg"),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Nhập mã mở khoá để xác thực",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Pinput(
                                      obscureText: true,
                                      obscuringCharacter: "•",
                                      controller: _pinPutController,
                                      autofocus: true,
                                      showCursor: false,
                                      useNativeKeyboard: false,
                                      length: 4,
                                      defaultPinTheme: defaultPinTheme,
                                      focusedPinTheme: focusPinTheme,
                                      onChanged: (pin) {
                                        if (pin.length != 4) {
                                          setCompletedFalse();
                                        } else if (pin.length == 4) {
                                          setCompleted();
                                          Future.delayed(
                                                  Duration(milliseconds: 600))
                                              .then((value) {
                                            _pinPutController.setText('');
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        HomeScreen()));
                                          });
                                        }
                                      },
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text("Quên mã mở khoá?",
                                        style: TextStyle(
                                          color: Color(0xff616161),
                                        )),
                                  ],
                                ),
                              ),
                              Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    height: 250,
                                    color: Color(0xffD2D4DB),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 5),
                                    child: Column(
                                      children: <Widget>[
                                        Expanded(
                                            flex: 1,
                                            child: Container(
                                              child: Row(
                                                children: <Widget>[
                                                  Expanded(
                                                      flex: 3,
                                                      child: Container(
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: <Widget>[
                                                            Expanded(
                                                              flex: 1,
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: <
                                                                    Widget>[
                                                                  ButtonNumber(
                                                                    title: '1',
                                                                    color: Colors
                                                                        .white,
                                                                    onTap: () {
                                                                      _pinPutController
                                                                              .text +=
                                                                          '1';
                                                                    },
                                                                  ),
                                                                  SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  ButtonNumber(
                                                                    title: '2',
                                                                    color: Colors
                                                                        .white,
                                                                    onTap: () {
                                                                      _pinPutController
                                                                              .text +=
                                                                          '2';
                                                                    },
                                                                  ),
                                                                  SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  ButtonNumber(
                                                                    title: '3',
                                                                    color: Colors
                                                                        .white,
                                                                    onTap: () {
                                                                      _pinPutController
                                                                              .text +=
                                                                          '3';
                                                                    },
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            Expanded(
                                                              flex: 1,
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: <
                                                                    Widget>[
                                                                  ButtonNumber(
                                                                    title: '4',
                                                                    color: Colors
                                                                        .white,
                                                                    onTap: () {
                                                                      _pinPutController
                                                                              .text +=
                                                                          '4';
                                                                    },
                                                                  ),
                                                                  SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  ButtonNumber(
                                                                    title: '5',
                                                                    color: Colors
                                                                        .white,
                                                                    onTap: () {
                                                                      _pinPutController
                                                                              .text +=
                                                                          '5';
                                                                    },
                                                                  ),
                                                                  SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  ButtonNumber(
                                                                    title: '6',
                                                                    color: Colors
                                                                        .white,
                                                                    onTap: () {
                                                                      _pinPutController
                                                                              .text +=
                                                                          '6';
                                                                    },
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 2.5,
                                                            ),
                                                          ],
                                                        ),
                                                      )),
                                                  Expanded(
                                                      flex: 1,
                                                      child: Container(
                                                        margin: EdgeInsets.only(
                                                          left: 5,
                                                          bottom: 2.5,
                                                        ),
                                                        width: _width,
                                                        height: _height,
                                                        decoration: BoxDecoration(
                                                            color: Color(
                                                                0xffAFB2BC),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        child: OutlinedButton(
                                                            style: OutlinedButton.styleFrom(
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5))),
                                                            onPressed: () {
                                                              final splited =
                                                                  _pinPutController
                                                                      .text
                                                                      .toString()
                                                                      .split(
                                                                          '');
                                                              splited
                                                                  .removeLast();
                                                              var newstring =
                                                                  '';
                                                              for (int i = 0;
                                                                  i <
                                                                      splited
                                                                          .length;
                                                                  i++) {
                                                                newstring +=
                                                                    splited[i];
                                                              }
                                                              setState(() {
                                                                _pinPutController
                                                                        .text =
                                                                    newstring;
                                                              });
                                                            },
                                                            child: Container(
                                                                width: 30,
                                                                child: Image.asset(
                                                                    "assets/delete.jpg"))),
                                                      )),
                                                ],
                                              ),
                                            )),
                                        Expanded(
                                            flex: 1,
                                            child: Container(
                                              child: Row(
                                                children: <Widget>[
                                                  Expanded(
                                                      flex: 3,
                                                      child: Container(
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: <Widget>[
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            Expanded(
                                                              flex: 1,
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: <
                                                                    Widget>[
                                                                  ButtonNumber(
                                                                    title: '7',
                                                                    color: Colors
                                                                        .white,
                                                                    onTap: () {
                                                                      _pinPutController
                                                                              .text +=
                                                                          '7';
                                                                    },
                                                                  ),
                                                                  SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  ButtonNumber(
                                                                    title: '8',
                                                                    color: Colors
                                                                        .white,
                                                                    onTap: () {
                                                                      _pinPutController
                                                                              .text +=
                                                                          '8';
                                                                    },
                                                                  ),
                                                                  SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  ButtonNumber(
                                                                    title: '9',
                                                                    color: Colors
                                                                        .white,
                                                                    onTap: () {
                                                                      _pinPutController
                                                                              .text +=
                                                                          '9';
                                                                    },
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            Expanded(
                                                              flex: 1,
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: <
                                                                    Widget>[
                                                                  Expanded(
                                                                      flex: 1,
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            _width,
                                                                        height: _height *
                                                                            0.9,
                                                                      )),
                                                                  SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  ButtonNumber(
                                                                    title: '0',
                                                                    color: Colors
                                                                        .white,
                                                                    onTap: () {
                                                                      _pinPutController
                                                                              .text +=
                                                                          '0';
                                                                    },
                                                                  ),
                                                                  SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  Expanded(
                                                                      flex: 1,
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            _width,
                                                                        height: _height *
                                                                            0.9,
                                                                      )),
                                                                ],
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 2.5,
                                                            ),
                                                          ],
                                                        ),
                                                      )),
                                                  Expanded(
                                                      flex: 1,
                                                      child: Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 2.5),
                                                        child: Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                            left: 5,
                                                            // top: 9,
                                                            bottom: 2.5,
                                                          ),
                                                          width: _width,
                                                          height: _height,
                                                          decoration: BoxDecoration(
                                                              color: !isCompleted
                                                                  ? Color(
                                                                      0xffC5C5C5)
                                                                  : Color(
                                                                      0xffAFB2BC),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                          child: OutlinedButton(
                                                              style: OutlinedButton.styleFrom(
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5))),
                                                              onPressed: () {},
                                                              child: Text(
                                                                "Xong",
                                                                style: TextStyle(
                                                                    color: !isCompleted
                                                                        ? Color(
                                                                            0xffA0A0A0)
                                                                        : Colors
                                                                            .black,
                                                                    fontSize:
                                                                        18),
                                                              )),
                                                        ),
                                                      )),
                                                ],
                                              ),
                                            )),
                                      ],
                                    ),
                                  )),
                            ]),
                          ),
                        );
                      });
                },
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: Container(
                    alignment: Alignment.center,
                    width: 105,
                    height: 29,
                    child: Text(
                      "Đăng nhập",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              SizedBox(
                height: 98,
              ),
              // Khám phá
              BarClick(width: _width, check: true),
              SizedBox(
                height: 25,
              ),
              Container(
                width: _width,
                height: 230,
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
                                      child: Image.asset("assets/book.jpg")),
                                )),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                                flex: 7,
                                child: Container(
                                  height: _height,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: 1.2,
                                              color: Colors.grey.shade300))),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'Hướng dẫn sử dụng',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      Icon(Icons.keyboard_arrow_right)
                                    ],
                                  ),
                                )),
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
                                      child: Image.asset("assets/warning.jpg")),
                                )),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                                flex: 7,
                                child: Container(
                                  height: _height,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: 1.2,
                                              color: Colors.grey.shade300))),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'Hướng dẫn bảo mật',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      Icon(Icons.keyboard_arrow_right)
                                    ],
                                  ),
                                )),
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
                                      child: Image.asset("assets/phone.jpg")),
                                )),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                                flex: 7,
                                child: Container(
                                  height: _height,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'Liên hệ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      Icon(Icons.keyboard_arrow_right)
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                width: _width,
                height: 285,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: _width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10))),
                      child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          child: Image.asset(
                            "assets/map.jpg",
                            fit: BoxFit.cover,
                          )),
                    ),
                    Container(
                      width: _width,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: _width * 0.14,
                          ),
                          Container(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  width: _width * 0.7,
                                  height: 80,
                                  decoration: BoxDecoration(
                                      // color: Colors.yellow,
                                      border: Border(
                                          bottom: BorderSide(
                                              width: 1,
                                              color: Color(0xffCCCCCC)))),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Tìm chi nhánh & ATM",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Container(
                                  width: _width * 0.7,
                                  height: 80,
                                  padding: EdgeInsets.symmetric(vertical: 14),
                                  alignment: Alignment.centerLeft,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "Đặt lịch hẹn",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        "Để được hỗ trợ và phục vụ tốt nhất tại quầy",
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
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
                height: 25,
              ),
              Container(
                width: _width,
                height: 150,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Container(
                  width: _width,
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 160,
                        height: 40,
                        margin: EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Tổng đài Techcombank",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w300),
                            ),
                            Text(
                              "1800 588 822",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        child: Container(
                            alignment: Alignment.centerRight,
                            width: 70,
                            height: 30,
                            child: Text(
                              "Gọi",
                              style: TextStyle(color: Colors.white),
                            )),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class ButtonNumber extends StatelessWidget {
  const ButtonNumber({super.key, this.title, this.onTap, this.color});

  final String? title;
  final Function()? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Expanded(
        flex: 1,
        child: Container(
          width: width,
          height: 60,
          child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                  backgroundColor: color,
                  shadowColor: Colors.grey.shade900,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5))),
              onPressed: onTap,
              child: Text(
                title!,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.w400),
              )),
        ));
  }
}
