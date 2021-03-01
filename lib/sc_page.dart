import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Details"),),
      body: Center(
        child: RaisedButton(child: Text("Back"), onPressed: () {
          Navigator.pop(context);
        },),
      ),
    );
  }
}