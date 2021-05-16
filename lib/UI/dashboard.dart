import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:notes_app/Model/notes.dart';
import 'package:notes_app/Model/shared_pref.dart';
import 'package:notes_app/UI/write_notes.dart';

List<Notes> notes = [];

class Dashboard extends StatefulWidget {
  // Dashboard() {
  //   Notes.getNotes().then((value) {
  //     notes = value;
  //   });
  // }

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    getID().then((id) {
      Notes.getNotes(id).then((value) {
        notes = value;
        setState(() {});
      });
    });

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Notes App",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(icon: Icon(Icons.edit), onPressed: null),
          IconButton(icon: Icon(Icons.search), onPressed: null)
        ],
      ),
      body: Center(
        child: (notes.length == 0)
            ? buildNoNotes()
            : ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                    padding: EdgeInsets.all(20),
                    color: Colors.blue[100],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          notes[index].title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          notes[index].text,
                          maxLines: 2,
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                  );
                }),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return WriteNotes();
          }));
        },
        backgroundColor: Color(0xFFF33B5F),
        label: Text("Create New",
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold)),
      ),
    );
  }

  Column buildNoNotes() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            width: 300,
            height: 300,
            child: Image(
              image: AssetImage("images/illustration.png"),
              fit: BoxFit.contain,
            )),
        Container(
            margin: EdgeInsets.all(20),
            child: Text(
              "It's Empty",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            )),
        Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: Text(
              "Hmm... looks like you don't have any notes",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 14),
            )),
      ],
    );
  }

  // ListView buildListNotes() {
  //   return ListView(
  //     children: [
  //       Container(
  //         margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
  //         padding: EdgeInsets.all(20),
  //         color: Colors.lightBlue,
  //         child: Text(
  //           "Hai",
  //           style: TextStyle(
  //               color: Colors.white,
  //               fontWeight: FontWeight.normal,
  //               fontSize: 20),
  //         ),
  //       ),
  //       Container(
  //         margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
  //         padding: EdgeInsets.all(20),
  //         color: Colors.lightBlue,
  //         child: Text(
  //           "Hai",
  //           style: TextStyle(
  //               color: Colors.white,
  //               fontWeight: FontWeight.normal,
  //               fontSize: 20),
  //         ),
  //       ),
  //       Container(
  //         margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
  //         padding: EdgeInsets.all(20),
  //         color: Colors.lightBlue,
  //         child: Text(
  //           "Hai",
  //           style: TextStyle(
  //               color: Colors.white,
  //               fontWeight: FontWeight.normal,
  //               fontSize: 20),
  //         ),
  //       ),
  //       Container(
  //           margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
  //           child: Center(
  //             child: Text(
  //               "Tidak ada notes lagi",
  //               style: TextStyle(
  //                   color: Colors.black,
  //                   fontWeight: FontWeight.normal,
  //                   fontSize: 20),
  //             ),
  //           )),
  //     ],
  //   );
  // }
}
