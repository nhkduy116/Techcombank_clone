// ignore_for_file: file_names, prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:techcombank_clone/HomeLoginScreen.dart';
import 'package:techcombank_clone/ManageDetailAcc.dart';

import 'CardAccountScreen.dart';

class BarClick extends StatelessWidget {
  final double width;
  bool? check;
  onClickButton(BuildContext context, check) {
    if (check == true) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ManageDetailAcc()));
    }
  }

  onClickHome(BuildContext context, check) {
    if (check == false) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => CardAccountScreen()));
    }
  }

  BarClick({required this.width, required this.check});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 95,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                onClickHome(context, check);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                      width: width * 0.07,
                      child: Image.asset("assets/wallet.jpg")),
                  Container(
                      width: width * 0.17,
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
                  SizedBox(
                      width: width * 0.07,
                      child: Image.asset("assets/change.jpg")),
                  Container(
                      width: width * 0.17,
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
                  SizedBox(
                      width: width * 0.07,
                      child: Image.asset("assets/qrcode.jpg")),
                  Container(
                      width: width * 0.17,
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
                  SizedBox(
                      width: width * 0.07,
                      child: Image.asset("assets/pay.jpg")),
                  Container(
                      width: width * 0.17,
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
              onTap: () {
                onClickButton(context, check);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                      width: width * 0.07,
                      child: Image.asset("assets/home.jpg")),
                  Container(
                      width: width * 0.17,
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
    );
  }
}
