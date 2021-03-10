import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:notes_app/Model/shared_pref.dart';

/// Class Users digunakan untuk menyimpan data data user (Instance) yang diambil dari database
class Users {
  /// field ini menyimpan id user
  String id;

  /// field ini menyimpan email user
  String email;

  ///Constructor dari class User.
  ///id dan email tidak boleh kosong karena tidak diset nilai defaultnya
  Users({this.id, this.email});

  factory Users.createUsers(String id, String email) {
    return Users(
      id: id,
      email: email,
    );
  }

  // static Future<Users> connectToAPI(String email, int job) async {
  //   String apiURL = "https://reqres.in/api/users";

  //   var apiResult = await http.post(apiURL, body: {"email": email, "job": job});
  //   var jsonObj = json.decode(apiResult.body);

  //   return Users.createUsers(jsonObj);
  // }

  static Future<bool> login(String email, String password) async {
    String url = "https://a66611d5a4c4.ngrok.io/notes_app/login.php";

    var result =
        await http.post(url, body: {'email': email, 'password': password});

    if (result.body.isNotEmpty) {
      var jsonObj = json.decode(result.body);

      if (jsonObj["success"] == "1") {
        saveLogin(true);
        saveID(jsonObj["id"].toString());
        saveEmail(jsonObj["email"].toString());
        // getEmail().then((value) {
        //   log(value.toString());
        // });
        // log(value.toString());

        return true;
      } else
        log("Salah password tp email bener");
      return false;
    } else
      log("Salah semua");
    return false;
  }
}
