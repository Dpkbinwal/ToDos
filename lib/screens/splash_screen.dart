import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todos/constants/colors.dart';
import 'package:todos/screens/Home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: [
          Image.asset('assets/images/todo.jpg'),
          Expanded(
            child: Center(
                child: Container(
                    child: Text('ToDo App !',
                      style: TextStyle(fontWeight: FontWeight.w900,fontSize: 35,color: tdGrey,letterSpacing: 5.3),))
            ),
          ),

        ],
      ),
    );
  }
}


