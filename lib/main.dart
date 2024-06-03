import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todos/screens/Home.dart';
import 'package:todos/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent)
    );
    return MaterialApp(
      title: "ToDo App",
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
