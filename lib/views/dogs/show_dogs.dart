import 'package:flutter/material.dart';
import 'package:warrior_pets/model/dog_breed.dart';
import 'package:warrior_pets/util/colors_app.dart';
import 'package:warrior_pets/view_model/list_dogs_breeds.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:warrior_pets/views/dogs/detail_dog_breed.dart';

class ShowDogs extends StatefulWidget {
  const ShowDogs({Key? key}) : super(key: key);

  @override
  State<ShowDogs> createState() => _ShowDogsState();
}

class _ShowDogsState extends State<ShowDogs> {

  String urlPhotoNull = "https://www.pngall.com/wp-content/uploads/10/Pet-Silhouette.png";

  final ScrollController _scrollController = ScrollController();
  int pageNumber = 0;
  ListDogsBreedsViewModel listDogsBreedsViewModel = ListDogsBreedsViewModel();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        pageNumber++;
        setState(() {
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.background,
      body:FutureBuilder(
        future: listDogsBreedsViewModel.fetchDogBreeds(pageNumber, 50),
        builder: (context, snapshot){

          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.active:
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text("Loading data...",style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: 30),
                Center(child: CircularProgressIndicator()),
              ],
            );
            case ConnectionState.done:
              return MasonryGridView.count(
                controller: _scrollController,
                itemCount: listDogsBreedsViewModel.dogBreeds!.length,
                crossAxisCount: 2,
                itemBuilder: (context, index) => cardDogBreed(listDogsBreedsViewModel.dogBreeds![index].dogBreed!),
              );
            case ConnectionState.none:
              return  const Center(child: Text('Internet connection problems.'));
            default:
              return const Center(child: Text('Problems receiving data.'));
          }

        },
      ),
    );
  }

  InkWell cardDogBreed(DogBreed dogBreed) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context)=>DetailDogBreed(dogBreed: dogBreed,))),
      child: Card(
        elevation: 10,
        shape:  RoundedRectangleBorder(
            side: const BorderSide(color: Colors.blue, width: 1),
            borderRadius: BorderRadius.circular(4.0)),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            ListTile(
              title: Text(dogBreed.name ?? "", textAlign: TextAlign.center,),
            ),
            Hero(
              tag: dogBreed.referenceImageId!,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  child: Image.network(dogBreed.image!.url ?? urlPhotoNull),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



