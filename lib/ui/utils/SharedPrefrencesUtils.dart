import 'dart:convert';

import 'package:e_commerce/data/models/auth_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPrefsUtils{
  static Future saveUser(User user) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("current_user", jsonEncode(user.toJson()));
  }
  static Future<User?> getUser() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? user = prefs.getString("current_user");
    if(user != null){
       return User.fromJson(jsonDecode(user));
    }
  }
  static Future saveToken(String token) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("token", token);
  }
  static Future<String?> getToken() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
  }

}