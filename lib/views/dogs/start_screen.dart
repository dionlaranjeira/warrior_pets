import 'package:flutter/material.dart';
import 'package:warrior_pets/util/colors_app.dart';
import 'package:warrior_pets/view_model/start_screen.dart';

class StartScren extends StatefulWidget {
  const StartScren({Key? key}) : super(key: key);

  @override
  State<StartScren> createState() => _StartScrenState();
}

class _StartScrenState extends State<StartScren> {

  @override
  void initState(){
    super.initState();
    StartScreenViewModel screenViewModel = StartScreenViewModel(context);
    screenViewModel.checkUserLogged();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor:ColorsApp.secondaryColor ,
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
