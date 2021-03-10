import 'package:flutter/material.dart';
import 'package:notes_app/UI/dashboard.dart';
import 'package:notes_app/UI/login_page.dart';
import 'package:notes_app/Model/shared_pref.dart';

void main() {
    runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    bool isLogin=false;
    loginCheck().then((value) => isLogin);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: (isLogin) ? Dashboard() : LoginPage(),
      /*
      TO-DO
      - BUG LANDSCAPE LOGIN REGISTER
      - BUG BACK DASHBOARD
      */
    );
  }
}