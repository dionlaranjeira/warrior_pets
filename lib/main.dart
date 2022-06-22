import 'package:flutter/material.dart';
import 'package:warrior_pets/views/show_dogs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ShowDogs())
  );
}