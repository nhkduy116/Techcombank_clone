import 'package:flutter/material.dart';
import 'package:techcombank_clone/HomeLoginScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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
