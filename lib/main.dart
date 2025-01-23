import 'package:flutter/material.dart';
import 'package:flutter_application_1/layout/home_layout.dart';
import 'package:flutter_application_1/modules/bmi/screen/bmi_screen.dart';
import 'package:flutter_application_1/modules/counter/counter_screen.dart';
import 'package:flutter_application_1/modules/home/home_screen.dart';
import 'package:flutter_application_1/modules/messenger/messenger_screen.dart';
import 'package:flutter_application_1/modules/users/user_screen.dart';
import 'package:flutter_application_1/modules/login/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget
{
 Widget build (BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeLayout()
    );
  }
}