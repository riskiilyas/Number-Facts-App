import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:number_facts/screens/HomeScreen.dart';

void main() {
  runApp(GetMaterialApp(
    home: MaterialApp(
      theme: ThemeData.dark(),
      home: const HomeScreen(),
    ),
  ));
}