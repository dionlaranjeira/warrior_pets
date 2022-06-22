import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:warrior_pets/model/dog_breed.dart';
import 'package:warrior_pets/view_model/list_dogs_breeds.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:warrior_pets/views/detail_dog_breed.dart';

class ShowDogs extends StatefulWidget {
  const ShowDogs({Key? key}) : super(key: key);

  @override
  State<ShowDogs> createState() => _ShowDogsState();
}

class _ShowDogsState extends State<ShowDogs> {

  String urlPhotoNull = "https://www.pngall.com/wp-content/uploads/10/Pet-Silhouette.png";

  ScrollController _scrollController = ScrollController();
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
      appBar: AppBar(title: const Text("SHOW DOGS"),),
      body:FutureBuilder(
        future: listDogsBreedsViewModel.fetchDogBreeds(pageNumber, 50),
        builder: (context, snapshot){

          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.active:
            return const Center(child: CircularProgressIndicator(),);
            case ConnectionState.done:
              return MasonryGridView.count(
                // physics: const AlwaysScrollableScrollPhysics(),
                controller: _scrollController,
                itemCount: listDogsBreedsViewModel.dogBreeds!.length,
                crossAxisCount: 2,
                itemBuilder: (context, index) => cardDogBreed(listDogsBreedsViewModel.dogBreeds![index].dogBreed!),
              );
            case ConnectionState.none:
              return  const Center(child: Text('Problemas de conexão com a internet'));
            default:
              return const Center(child: Text('Problemas ao receber dados'));
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
              subtitle: Text(dogBreed.breedGroup ?? "", textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ),
            // Image.network(dogBreed.image!.url ?? urlPhotoNull),
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



