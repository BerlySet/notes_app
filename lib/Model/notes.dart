import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:notes_app/Model/shared_pref.dart';

/// Class ini menyimpan Objek Objek Notes tiap pengguna
class Notes {
  String id;
  String idp;
  String title;
  String text;
  String attachment;
  String dateTimeCreated;

  ///Constructor dari class Notes.
  ///id dan email tidak boleh kosong karena tidak diset nilai defaultnya
  Notes(
      {this.id,
      this.idp,
      this.title = "No Title",
      this.text =
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer feugiat at ex laoreet lacinia. Pellentesque suscipit scelerisque semper. Praesent eu velit elementum, auctor tellus quis, varius sapien. Nulla nec erat lectus. ",
      this.attachment = "No Attachment",
      this.dateTimeCreated});

  factory Notes.createNotes(Map<String, dynamic> object) {
    return Notes(
      id: object['id'],
      idp: object['idp'],
      title: object['title'],
      text: object['text'],
      attachment: object['attachment'],
      dateTimeCreated: object['datetime_created'],
    );
  }

  static Future<List<Notes>> getNotes(String page) async {
    String url = "http://433f0fdf7492.ngrok.io/notes_app/read_notes.php";

    var result = await http.post(url, body: {'id': getID()});
    
  }
}
