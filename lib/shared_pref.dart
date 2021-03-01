import 'package:shared_preferences/shared_preferences.dart';

void saveID(String id) async    //tentuny async karena menyimpan data tidak dalam waktu realtime
{
	SharedPreferences pref = await SharedPreferences.getInstance();
	pref.setString("id", id);
}

void saveEmail(String email) async    //tentuny async karena menyimpan data tidak dalam waktu realtime
{
	SharedPreferences pref = await SharedPreferences.getInstance();
	pref.setString("email", email);
}

void saveLogin(bool isLogin) async    //tentuny async karena menyimpan data tidak dalam waktu realtime
{
	SharedPreferences pref = await SharedPreferences.getInstance();
	pref.setBool("isLogin", isLogin);
}

Future<String> getID() async{
	SharedPreferences pref = await SharedPreferences.getInstance();
	return pref.getString("id") ?? "No id";
}

Future<String> getEmail() async{
	SharedPreferences pref = await SharedPreferences.getInstance();
	return pref.getString("email") ?? "NULL";
}

Future<bool> loginCheck() async{
	SharedPreferences pref = await SharedPreferences.getInstance();
	return pref.getBool("isLogin") ?? false;
}