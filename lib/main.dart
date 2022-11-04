import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:warrior_pets/util/colors_app.dart';
import 'package:warrior_pets/views/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();

  runApp(MaterialApp(
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
              seedColor: ColorsApp.primaryColor,
              primary: ColorsApp.primaryColor,
              secondary: ColorsApp.secondaryColor,
              error: ColorsApp.error)),
      debugShowCheckedModeBanner: false,
      home: const Home()));
}
