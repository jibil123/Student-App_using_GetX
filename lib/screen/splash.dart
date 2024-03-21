// ignore_for_file: camel_case_types

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite_10/screen/homescreen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2),(){
     Get.off(const HomeScreeen());
    }
    );
    return Scaffold(
      body: Center(
        child: Image.asset('assets/istockphoto-1460007178-2048x2048.jpg',),
      ),
    );
  }
}