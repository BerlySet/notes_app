import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/UI/signup.dart';
import 'package:notes_app/UI/dashboard.dart';
import 'package:notes_app/Model/users.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController contEmail = TextEditingController(text: "");
  TextEditingController contPass = TextEditingController(text: "");
  bool isLogin = false;
  Users user;
  
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
                child: Text("Hello There!",
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
                  controller: contEmail,
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
                  controller: contPass,
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 40, top: 5),
                  child: RaisedButton(
                      color: Color(0xFFF33B5F),
                      padding: EdgeInsets.fromLTRB(45, 15, 45, 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Text("Login",
                          style: TextStyle(
                              fontFamily: "Roboto",
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                      onPressed: () {
                        setState(() {});
                        (contEmail.text.isEmpty || contPass.text.isEmpty)
                            ? Alert(
                                    context: context,
                                    title: "Failed",
                                    image: Icon(Icons.warning),
                                    desc: "Email or Password cannot be empty")
                                .show()
                            : Users.login(contEmail.text, contPass.text)
                                .then((value) {
                                if (value == true) {
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) {
                                    return Dashboard();
                                  }));
                                } else {
                                  Alert(
                                          context: context,
                                          title: "Failed",
                                          desc:
                                              "Email or Password doesn't Match")
                                      .show();
                                }
                              });
                      }),
                ),
                Container(
                  margin: EdgeInsets.only(left: 25),
                  alignment: Alignment.centerRight,
                  child: Text("Forgot Password?",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Roboto",
                          fontSize: 18,
                          fontWeight: FontWeight.w800)),
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
                Text("You are not a member?  ",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Roboto",
                        fontSize: 18,
                        fontWeight: FontWeight.w800)),
                RichText(
                    text: TextSpan(
                        text: "Register",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return SignUp();
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
