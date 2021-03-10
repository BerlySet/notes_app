import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WriteNotes extends StatefulWidget {
  @override
  _WriteNotesState createState() => _WriteNotesState();
}

class _WriteNotesState extends State<WriteNotes> {
  TextEditingController titleNotesCont = TextEditingController(text: "");
  TextEditingController isiNotesCont = TextEditingController(text: "");
  List<bool> selected = [false, false, false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Icon(Icons.arrow_back_ios, color: Colors.black38,),
        actions: [
          IconButton(
              icon: Icon(
                Icons.attach_file,
              ),
              onPressed: null),
          IconButton(icon: Icon(Icons.save), onPressed: null),
        ],
      ),
      body: Stack(
        children: [
          Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Title...",
                    hintStyle: TextStyle(
                        color: Colors.black38,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        fontFamily: "Roboto")),
                controller: titleNotesCont,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    fontFamily: "Roboto"),
                maxLines: 1,
                onChanged: (value) {
                  setState(() {});
                },
              )),
          Container(
              margin: EdgeInsets.fromLTRB(20, 35, 20, 70),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "type here...",
                    hintStyle: TextStyle(
                        color: Colors.black38,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        fontFamily: "Roboto")),
                controller: isiNotesCont,
                maxLines: 200,
                onChanged: (value) {
                  setState(() {});
                },
              )),
          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: Container(
              // color: Colors.white,
              child: ToggleButtons(
                children: [
                  Icon(Icons.format_align_left),
                  Icon(Icons.format_align_center),
                  Icon(Icons.format_align_right),
                  Icon(Icons.format_list_bulleted),
                  Icon(Icons.format_bold),
                  Icon(Icons.format_underline),
                  Icon(Icons.format_italic),
                ],
                isSelected: selected,
                onPressed: (index) {
                  setState(() {
                    if (index < 3) {
                      if (selected[index] == true)
                        selected[index] = false;
                      else {
                        for (int i = 0; i < 3; i++) {
                          selected[i] = (i == index) ? true : false;
                        }
                      }
                    } else
                      selected[index] = !selected[index];
                  });
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
