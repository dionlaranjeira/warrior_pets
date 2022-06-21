import 'package:flutter/material.dart';

class ShowDogs extends StatefulWidget {
  const ShowDogs({Key? key}) : super(key: key);

  @override
  State<ShowDogs> createState() => _ShowDogsState();
}

class _ShowDogsState extends State<ShowDogs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SHOW DOGS"),),
      body: Container(),
    );
  }
}
