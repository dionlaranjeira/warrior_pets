import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:warrior_pets/util/utils.dart';
class DetailDogBreed extends StatefulWidget {
  final dynamic dogBreed;
  const DetailDogBreed({Key? key, required this.dogBreed}) : super(key: key);

  @override
  _DetailDogBreedState createState() => _DetailDogBreedState();
}

class _DetailDogBreedState extends State<DetailDogBreed> {


  String urlPhotoNull = "https://www.pngall.com/wp-content/uploads/10/Pet-Silhouette.png";
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(widget.dogBreed.nameString),
    ),
    body:   SingleChildScrollView(
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            ListTile(
              leading: SvgPicture.asset(Utils.urlIconDog, width: 50),
              title: Text("Dog Category: "+widget.dogBreed.breedGroupString),
              subtitle: Text(
                widget.dogBreed.bredForString,
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ),
            Hero(
              tag: widget.dogBreed.referenceImageId!,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  child: Image.network(widget.dogBreed.image!.url ?? urlPhotoNull),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Temperament: "+widget.dogBreed.temperamentString +"\nLife Span: "+ widget.dogBreed.lifeSpanString +"\nOrigin: " + widget.dogBreed.originString, textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ),
          ],
        ),
      ),
    ),
    bottomNavigationBar:   ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.blue,
          onPrimary: Colors.white,
          shadowColor: Colors.blueAccent,
          elevation: 3,
        ),
        onPressed: (){Navigator.pop(context);},
        child:  Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.arrow_back_ios),
              SizedBox(width: 10),
              Text("Back", style: TextStyle(fontSize: 18)),
            ],
          ),
        )),
  );
}