import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:notes_app/users.dart';

class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  Users users = null;

  TabBar tabbar = TabBar(
    //indicatorColor: Colors.amber,
    indicator: BoxDecoration(
        color: Colors.grey,
        border: Border(top: BorderSide(color: Colors.black, width: 5))),
    tabs: [
      Tab(
        icon: Icon(Icons.home),
        text: "Home",
      ),
      Tab(
        child: Image(
          image: AssetImage("images/Google.png"),
        ),
      ),
      Tab(
        icon: Icon(Icons.alarm),
      ),
      Tab(
        text: "Chats",
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
              title: Text("Promo Hari Ini"),
              bottom: PreferredSize(
                  preferredSize: Size.fromHeight(tabbar.preferredSize.height),
                  child: Container(color: Colors.grey[900], child: tabbar))),
          body: TabBarView(
            children: [
              Center(
                child: RaisedButton(
                  onPressed: () {
                    // Users.connectToAPI("Nama input", "Job input").then((value) {
                    //   users = value;
                    //   setState(() {});
                    // });
                  },
                ),
              ),
              Center(
                  child: Text(
                "Tab 2",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFeatures: [FontFeature.enable('smcp')]),
              )),
              Center(
                  child: Text(
                "Tab 3",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
              Center(
                  child: Text(
                "Tab 4",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

class ShaderTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ShaderMask(
            shaderCallback: (rectangle) {
              return LinearGradient(
                      colors: [Colors.black, Colors.transparent],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)
                  .createShader(
                      Rect.fromLTRB(0, 0, rectangle.width, rectangle.height));
            },
            blendMode: BlendMode.dstIn,
            child: Image(
              width: 300,
              image: NetworkImage(""),
            ),
          ),
        ),
      ),
    );
  }
}
