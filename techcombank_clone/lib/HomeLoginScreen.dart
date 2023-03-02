// ignore_for_file: prefer_const_constructors, file_names, no_leading_underscores_for_local_identifiers, unused_local_variable, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, unused_import, unnecessary_import, unnecessary_new, unnecessary_null_comparison, prefer_typing_uninitialized_variables, unused_field

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:techcombank_clone/CardAccountScreen.dart';
import 'package:techcombank_clone/DataAcc.dart';
import 'package:techcombank_clone/HomeScreen.dart';
import 'package:techcombank_clone/ManageDetailAcc.dart';

class HomeLoginScreen extends StatefulWidget {
  const HomeLoginScreen({super.key});

  @override
  State<HomeLoginScreen> createState() => _HomeLoginScreenState();
}

class _HomeLoginScreenState extends State<HomeLoginScreen> with TickerProviderStateMixin {
  bool isCompleted = false;
  final TextEditingController _pinPutController = TextEditingController();
  late AnimationController _animationController;
  late Animation<double> _animation;

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
    
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    const borderColor = Color.fromRGBO(23, 171, 144, 0.4);

    final defaultPinTheme = PinTheme(
      width: 40,
      height: 56,
      margin: EdgeInsets.only(right: 16),
      textStyle: const TextStyle(
        fontSize: 22,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 2
          )
        ),
      ),
    );

    final focusPinTheme = defaultPinTheme.copyBorderWith(
        border: Border(
          bottom: BorderSide(
            color: Color(0xff3682EC),
            width: 2
          )
        )
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffBA2F32),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
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
                    Consumer<MyData>(
                      builder: (context, myData, child) {
                        return Text(
                          myData.name.toString(),
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        );
                      },
                    ),
                    
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              OutlinedButton(
                onPressed: () {
                  showModalBottomSheet(
                    transitionAnimationController: _animationController,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      )
                    ),
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
                        height: _height*0.91,
                        child: Stack(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Icon(Icons.close, color: Colors.grey.shade800,),
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
                                  Text("Nhập mã mở khoá để xác thực", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Pinput(
                                    obscureText: true,
                                    controller: _pinPutController,
                                    showCursor: false,
                                    autofocus: true,
                                    useNativeKeyboard: false,
                                    length: 4,
                                    defaultPinTheme: defaultPinTheme,
                                    focusedPinTheme: focusPinTheme,
                                    onChanged: (pin) {
                                      if (pin.length != 4) {
                                        setCompletedFalse();
                                      } else if (pin.length == 4) {
                                        setCompleted();
                                        Future.delayed(Duration(milliseconds: 600)).then((value) {
                                          _pinPutController.setText('');
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                                        });
                                      }
                                    },
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text("Quên mã mở khoá?", style: TextStyle(color: Color(0xff616161),)),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: 300,
                                color: Color(0xffD2D4DB),
                                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
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
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: <Widget>[
                                                    Expanded(
                                                      flex: 1,
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: <Widget>[
                                                          ButtonNumber(
                                                            title: '1',
                                                            color: Colors.white,
                                                            onTap: () {
                                                              _pinPutController.text += '1';
                                                            },
                                                          ),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          ButtonNumber(title: '2', color: Colors.white,
                                                            onTap: () {
                                                              _pinPutController.text += '2';
                                                            },
                                                          ),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          ButtonNumber(title: '3', color: Colors.white,
                                                            onTap: () {
                                                              _pinPutController.text += '3';
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
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: <Widget>[
                                                          ButtonNumber(title: '4', color: Colors.white,
                                                            onTap: () {
                                                              _pinPutController.text += '4';
                                                            },
                                                          ),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          ButtonNumber(title: '5', color: Colors.white,
                                                            onTap: () {
                                                              _pinPutController.text += '5';
                                                            },
                                                          ),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          ButtonNumber(title: '6', color: Colors.white,
                                                            onTap: () {
                                                              _pinPutController.text += '6';
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
                                              )
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                margin: EdgeInsets.only(left: 5, bottom: 2.5, ),
                                                width: _width,
                                                height: _height,
                                                decoration: BoxDecoration(
                                                  color: Color(0xffAFB2BC),
                                                  borderRadius: BorderRadius.circular(5)
                                                ),
                                                child: OutlinedButton(
                                                  style: OutlinedButton.styleFrom(
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(5)
                                                    )
                                                  ),
                                                  onPressed: () {
                                                    final splited = _pinPutController.text.toString().split('');
                                                    splited.removeLast();
                                                    var newstring = '';
                                                    for (int i = 0; i < splited.length; i++) {
                                                      newstring += splited[i];
                                                    }
                                                    setState(() {
                                                      _pinPutController.text = newstring;
                                                    });
                                                  },
                                                  child: Container(
                                                    width: 30,
                                                    child: Image.asset("assets/delete.jpg")
                                                  )
                                                ),
                                              )
                                            ),
                                          ],
                                        ),
                                      )
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              flex: 3,
                                              child: Container(
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: <Widget>[
                                                    SizedBox(
                                                      height: 2.5,
                                                    ),
                                                    Expanded(
                                                      flex: 1,
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: <Widget>[
                                                          ButtonNumber(title: '7', color: Colors.white,
                                                            onTap: () {
                                                              _pinPutController.text += '7';
                                                            },
                                                          ),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          ButtonNumber(title: '8', color: Colors.white,
                                                            onTap: () {
                                                              _pinPutController.text += '8';
                                                            },
                                                          ),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          ButtonNumber(title: '9', color: Colors.white,
                                                            onTap: () {
                                                              _pinPutController.text += '9';
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
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: <Widget>[
                                                          Expanded(
                                                            flex: 1,
                                                            child: Container(
                                                              width: _width,
                                                              height: _height*0.9,
                                                            )
                                                          ),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          ButtonNumber(title: '0', color: Colors.white,
                                                            onTap: () {
                                                              _pinPutController.text += '0';
                                                            },
                                                          ),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          Expanded(
                                                            flex: 1,
                                                            child: Container(
                                                              width: _width,
                                                              height: _height*0.9,
                                                            )
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 2.5,
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                margin: EdgeInsets.only(left: 5, bottom: 2.5, ),
                                                width: _width,
                                                height: _height,
                                                decoration: BoxDecoration(
                                                  color: !isCompleted ? Color(0xffC5C5C5) : Color(0xffAFB2BC),
                                                  borderRadius: BorderRadius.circular(5)
                                                ),
                                                child: OutlinedButton(
                                                  style: OutlinedButton.styleFrom(
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(5)
                                                    )
                                                  ),
                                                  onPressed: () {

                                                  },
                                                  child: Text("Xong", style: TextStyle(color: !isCompleted ? Color(0xffA0A0A0) : Colors.black, fontSize: 18),)
                                                ),
                                              )
                                            ),
                                          ],
                                        ),
                                      )
                                    ),
                                  ],
                                ),
                              )
                            ),
                          ]
                        ),
                      ),
                      );
                    }
                  );
                },
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
                        onTap: () {
                          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                          ManageDetailAcc()), (Route<dynamic> route) => false);
                        },
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
        height: height*0.9,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            backgroundColor: color,
            shadowColor: Colors.grey.shade900,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5)
            )
          ),
          onPressed: onTap,
          child: Text(title!, textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 28, fontWeight: FontWeight.w400),)
        ),
      )
    );
  }
}