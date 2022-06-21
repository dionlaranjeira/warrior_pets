import 'package:flutter/material.dart';

class ShowDogs extends StatefulWidget {
  const ShowDogs({Key? key}) : super(key: key);

  @override
  State<ShowDogs> createState() => _ShowDogsState();
}

class _ShowDogsState extends State<ShowDogs> {

  Map breed = {"id": 3,
  "name": "African Hunting Dog",
  "bred_for": "A wild pack animal",
  "life_span": "11 years",
  "temperament": "Wild, Hardworking, Dutiful",
  "origin": "",
  "reference_image_id": "rkiByec47"};

  Map image = {
  "id": "rkiByec47",
  "width": 500,
  "height": 335,
  "url": "https://cdn2.thedogapi.com/images/rkiByec47.jpg"
  };


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SHOW DOGS"),),
      body:Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.pets),
              title: Text(breed["name"]),
              subtitle: Text(
                breed["bred_for"],
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ),
            Image.network(image["url"]),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Temperament: " + breed["temperament"] + "\nLife Span: " + breed["life_span"],textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
