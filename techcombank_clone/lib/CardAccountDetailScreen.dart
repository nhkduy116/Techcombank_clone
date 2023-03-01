// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
              onPressed: null),
//        backgroundColor: Colors.transparent,
          title: Center(
            child: Text("Tài khoản thanh toán",
                style: TextStyle(color: Colors.black)),
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
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg.jpg"), fit: BoxFit.fill),
          ),
          child: Container(
              child: Column(
            children: [
              Container(
                height: 90,
              ),
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    width: 280,
                    height: 180,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 150, right: 40, left: 40),
                    child: Column(children: [
                      Container(
                        color: Colors.red,
                        width: 280,
                        child: Row(
                          children: [
                            Text("LE TAN CUONG"),
                            Text("***2264"),
                            Icon(Icons.remove_red_eye_outlined)
                          ],
                        ),
                      ),
                      Container(
                        child: Column(children: [
                          Text("Số dư"),
                          Row(
                            children: [Text("VND"), Text("354,604")],
                          ),
                          Text("Số tài khoản"),
                          Row(
                            children: [
                              Text(
                                "19039809938012",
                                style: TextStyle(fontSize: 20),
                              ),
                              Container(
                                  margin: EdgeInsets.only(bottom: 8, left: 10),
                                  width: 30,
                                  height: 30,
                                  child: Image.asset("assets/share.jpg"))
                            ],
                          )
                        ]),
                      )
                    ]),
                  )
                ],
              ),
            ],
          )),
        ));
  }
}
