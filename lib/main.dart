import 'package:flutter/material.dart';
import './ui/home.dart';
import './ui/login.dart';

void main(){
  runApp(
    MaterialApp(
      //home: Home(),
      debugShowCheckedModeBanner: false,
      home: Login(),
    )
  );
}