import 'package:flutter/material.dart';
import 'package:notes_app/Model/notes.dart';
import 'package:notes_app/Model/shared_pref.dart';
import 'package:notes_app/UI/write_notes.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Notes> notesList = [];

  @override
  Widget build(BuildContext context) {
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
        child: (notesList.isEmpty)
            ? buildNoNotes()
            : ListView.builder(itemBuilder: (context, index) {}),
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

//   ListView buildListNotes() {
//     return ListView(
//       children: [
//         Container(
//           margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
//           padding: EdgeInsets.all(20),
//           color: Colors.lightBlue,
//           child: Text(
//             "Hai",
//             style: TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.normal,
//                 fontSize: 20),
//           ),
//         ),
//         Container(
//           margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
//           padding: EdgeInsets.all(20),
//           color: Colors.lightBlue,
//           child: Text(
//             "Hai",
//             style: TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.normal,
//                 fontSize: 20),
//           ),
//         ),
//         Container(
//           margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
//           padding: EdgeInsets.all(20),
//           color: Colors.lightBlue,
//           child: Text(
//             "Hai",
//             style: TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.normal,
//                 fontSize: 20),
//           ),
//         ),
//         Container(
//             margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
//             child: Center(
//               child: Text(
//                 "Tidak ada notes lagi",
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.normal,
//                     fontSize: 20),
//               ),
//             )),
//       ],
//     );
//   }
}
