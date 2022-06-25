import 'package:flutter/material.dart';
import 'package:warrior_pets/util/colors_app.dart';

class DetailDogBreed extends StatefulWidget {
  final dynamic dogBreed;

  const DetailDogBreed({Key? key, required this.dogBreed}) : super(key: key);

  @override
  _DetailDogBreedState createState() => _DetailDogBreedState();
}

class _DetailDogBreedState extends State<DetailDogBreed> {
  String urlPhotoNull =
      "https://www.pngall.com/wp-content/uploads/10/Pet-Silhouette.png";

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.secundarybackground,
        title: textAppBar(context),
        automaticallyImplyLeading: false,
      ),
      body: MediaQuery(
        data: const MediaQueryData(),
        child: Scaffold(
          backgroundColor: ColorsApp.secundarybackground,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Image.network(widget.dogBreed.image!.url ?? urlPhotoNull),
                    Positioned(
                      bottom: -50,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: containerInforsDog(context),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 90),
                paddingExtraInforsDogs(),
                const SizedBox(height: 20),
                btnBack(context),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ));

  Padding paddingExtraInforsDogs() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Text(
        "Temperament: " + widget.dogBreed.temperament,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: ColorsApp.primaryColor,
          fontSize: 18,
        ),
      ),
    );
  }

  Container textAppBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: MediaQuery.of(context).size.width * 0.8,
      child: Text(widget.dogBreed.name,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: ColorsApp.primaryColor)),
    );
  }

  Container containerInforsDog(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(32)),
        boxShadow: [
          BoxShadow(color: ColorsApp.background, spreadRadius: 4),
        ],
      ),
      child: Column(
        children: [
          Text(
            "Dog Category: " + widget.dogBreed.breedGroupString,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: ColorsApp.primaryColor,
                fontSize: 14),
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Text(widget.dogBreed.bredForString,
                  textAlign: TextAlign.center)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.pin_drop_outlined, size: 14),
              const SizedBox(
                width: 10,
              ),
              Text(
                widget.dogBreed.originString,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.calendar_today, size: 14),
              const SizedBox(
                width: 10,
              ),
              Text(
                widget.dogBreed.lifeSpan,
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  ElevatedButton btnBack(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: const Text("Back"),
      style: ElevatedButton.styleFrom(
          primary: ColorsApp.secondaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
          textStyle:
              const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
    );
  }
}
