import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:notes_app/login_page.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController contSU = TextEditingController(text: "");
  TextEditingController contPassSU = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(40, 0, 0, 0),
                child: Text("Sign Up!",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Roboto",
                        fontSize: 36,
                        fontWeight: FontWeight.w800))),
            Center(
              child: Container(
                margin: EdgeInsets.fromLTRB(37, 18, 37, 18),
                child: TextField(
                  decoration: InputDecoration(
                      fillColor: Colors.blue[50],
                      filled: true,
                      labelText: "Email",
                      prefixIcon: Icon(Icons.email),
                      //hintText: "Pastikan email kamu aktif ya!",
                      prefixStyle: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Roboto",
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                  onChanged: (value) {},
                  controller: contSU,
                ),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.fromLTRB(37, 0, 37, 18),
                child: TextField(
                  decoration: InputDecoration(
                      fillColor: Colors.blue[50],
                      filled: true,
                      labelText: "Password",
                      //hintText: "Jangan pakai tanggal lahir ya!",
                      prefixIcon: Icon(Icons.vpn_key),
                      prefixStyle: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Roboto",
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                  obscureText: true,
                  onChanged: (value) {},
                  controller: contPassSU,
                ),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.fromLTRB(37, 0, 37, 18),
                child: TextField(
                  decoration: InputDecoration(
                      fillColor: Colors.blue[50],
                      filled: true,
                      labelText: "Confirm Password",
                      prefixIcon: Icon(Icons.vpn_key),
                      prefixStyle: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Roboto",
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                  obscureText: true,
                  onChanged: (value) {},
                  controller: contPassSU,
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 40, top: 5, right: 12),
                  child: RaisedButton(
                      color: Color(0xFFF33B5F),
                      padding: EdgeInsets.fromLTRB(70, 19, 70, 19),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Text("Register",
                          style: TextStyle(
                              fontFamily: "Roboto",
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return LoginPage();
                        }));
                      }),
                ),
                Container(
                  margin: EdgeInsets.only(left: 25),
                  alignment: Alignment.centerRight,
                  child: FloatingActionButton(
                    backgroundColor: Color(0xFFF33B5F),
                    onPressed: () {},
                    mini: false,
                    elevation: 0,
                    child: Image(
                      image: AssetImage("images/Google.png"),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        Container(
            alignment: Alignment.bottomLeft,
            margin: EdgeInsets.fromLTRB(37, 0, 0, 25),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Already have an account?  ",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Roboto",
                        fontSize: 18,
                        fontWeight: FontWeight.w800)),
                RichText(
                    text: TextSpan(
                        text: "Login",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return LoginPage();
                            }));
                          },
                        style: TextStyle(
                            color: Color(0xFFF33B5F),
                            fontFamily: "Roboto",
                            fontSize: 18,
                            fontWeight: FontWeight.w800)))
              ],
            ))
      ]),
    );
  }
}
