import 'dart:async';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class UserAuthController {
  static String accessToken = '';
  static const String _tokenKey = 'token';

  static Future<void> saveUserToken(String tkn) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString(_tokenKey, tkn);
    accessToken = tkn;
    log(tkn, time: DateTime.now());
  }

  static Future<String> getUserToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String tkn = pref.getString(_tokenKey) ?? '';
    accessToken = tkn;
    log(tkn, time: DateTime.now());
    return tkn;
  }

  static Future<bool> checkLoggedInState() async {
    String token = await getUserToken();
    return token.isNotEmpty;
  }

  static Future<void> clearUserData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.clear();
    accessToken = '';
  }
}
