import 'package:flutter/material.dart';
import 'package:warrior_pets/util/colors_app.dart';
import 'package:warrior_pets/views/dogs/start_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            seedColor: ColorsApp.primaryColor,
            primary: ColorsApp.primaryColor,
            secondary: ColorsApp.secondaryColor,
            error: ColorsApp.error
        )
      ),
      debugShowCheckedModeBanner: false,
      home: const StartScren())
  );
}