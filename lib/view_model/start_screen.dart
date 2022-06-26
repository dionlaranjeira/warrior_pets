import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:warrior_pets/views/home.dart';
import 'package:warrior_pets/views/login.dart';

class StartScreenViewModel{
  BuildContext context;
  late final prefs;

  StartScreenViewModel(this.context);

  Future<void> checkUserLogged() async{
    prefs = await SharedPreferences.getInstance();
    if (prefs.getString('user') != null){
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context)=>const Home()));
    }else{
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context)=>const Login()));
    }
  }

}
