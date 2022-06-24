import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:warrior_pets/util/colors_app.dart';
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
        title: Text(widget.dogBreed.name),
      ),
      body: MediaQuery(
      data: const MediaQueryData(),
      child: Scaffold(
        backgroundColor: ColorsApp.secundarybackground,
        body: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                    child: Image.network(widget.dogBreed.image!.url ?? urlPhotoNull),
                ),
                Positioned(
                  bottom: -50,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      constraints: const BoxConstraints(maxWidth: 400),
                      height: 100,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        boxShadow: [
                          BoxShadow(color: ColorsApp.background, spreadRadius: 4),
                        ],
                      ),
                    child: Column(
                      children: [
                        Text("Dog Category: "+widget.dogBreed.breedGroupString,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold, color: ColorsApp.primaryColor, fontSize: 18),),
                        Text(
                          widget.dogBreed.bredForString,
                          style: TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                        
                        
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.pin_drop_outlined),
                            const SizedBox(width: 10,),
                            Text(widget.dogBreed.originString, textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.black.withOpacity(0.6)),
                            ),
                          ],
                        ),

                      ],
                    ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 150),
            const Text(
              'Compre produtos indígenas',
              style: TextStyle(
                color: ColorsApp.primaryColor,
                fontSize: 22,
              ),
            ),

            const SizedBox(height: 80,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 15.0,
                    height: 15.0,
                    decoration: const BoxDecoration(
                      color: ColorsApp.primaryColor,
                      shape: BoxShape.circle,
                    )),
                const SizedBox(width: 15,),
                Container(
                    width: 15.0,
                    height: 15.0,
                    decoration: const BoxDecoration(
                      color: ColorsApp.primaryColor,
                      shape: BoxShape.circle,
                    )),
                const SizedBox(width: 15,),
                Container(
                    width: 15.0,
                    height: 15.0,
                    decoration: const BoxDecoration(
                      color: ColorsApp.primaryColor,
                      shape: BoxShape.circle,
                    )),
              ],
            ),

            Expanded(child: Container()),
          ],
        ),
      ),
    )






  );
}