import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:warrior_pets/util/utils.dart';
import 'package:warrior_pets/views/login.dart';

class LoginUserViewModel {
  late final prefs;
  late bool? logeed;

  loginUser(String email) async {
    for (String user in Utils.users["users"]) {
      if (email == user) {
        prefs = await SharedPreferences.getInstance();
        await prefs.setString('user', email);
        return true;
      }
    }
    return false;
  }

  logoutUser(BuildContext context) async {
    prefs = await SharedPreferences.getInstance();
    await prefs.remove('user');
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const Login()));
  }
}
