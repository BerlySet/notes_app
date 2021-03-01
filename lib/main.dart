import 'package:flutter/material.dart';
import 'package:notes_app/dashboard.dart';
import 'package:notes_app/login_page.dart';
import 'package:notes_app/shared_pref.dart';

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