import 'package:flutter/material.dart';
import 'package:todos/constants/colors.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting',style: TextStyle(letterSpacing: 3.4, fontSize: 23,fontWeight: FontWeight.w900,color: Colors.white),),
        backgroundColor: tdGrey,
      ),
      body: Center(child: Text('This is User setting Screen')),
    );
  }
}
