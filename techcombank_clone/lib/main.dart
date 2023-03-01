// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:techcombank_clone/HomeLoginScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // transparent status bar
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Techcombank Clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeLoginScreen(),
    );
  }
}
