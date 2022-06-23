import 'package:flutter/material.dart';

class DetailCat extends StatefulWidget {
  final dynamic catBreed;
  const DetailCat({Key? key, required this.catBreed}) : super(key: key);

  @override
  State<DetailCat> createState() => _DetailCatState();
}

class _DetailCatState extends State<DetailCat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.catBreed.name),),
      body: Text("Detalhes gato!"),
    );
  }
}
