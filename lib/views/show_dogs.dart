import 'package:flutter/material.dart';
import 'package:warrior_pets/model/dog_breed.dart';
import 'package:warrior_pets/view_model/list_dogs_breeds.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ShowDogs extends StatefulWidget {
  const ShowDogs({Key? key}) : super(key: key);

  @override
  State<ShowDogs> createState() => _ShowDogsState();
}

class _ShowDogsState extends State<ShowDogs> {

  ListDogsBreedsViewModel listDogsBreedsViewModel = ListDogsBreedsViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SHOW DOGS"),),
      body:FutureBuilder(
        future: listDogsBreedsViewModel.fetchDogBreeds(0, 100),
        builder: (context, snapshot){

          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.active:
            return const Center(child: CircularProgressIndicator(),);
            case ConnectionState.done:
              return MasonryGridView.count(
                itemCount: listDogsBreedsViewModel.dogBreeds!.length,
                crossAxisCount: 2,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
                itemBuilder: (context, index) => cardDogBreed(listDogsBreedsViewModel.dogBreeds![index].dogBreed!),
              );
            case ConnectionState.none:
              return const Text('Problemas de conexão com a internet');
            default:
              return const Text('Problemas ao receber dados');
          }

        },
      ),
    );
  }

  Card cardDogBreed(DogBreed dogBreed) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.pets),
            title: Text(dogBreed.name ?? ""),
            subtitle: Text(dogBreed.name ?? "",
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          Image.network(dogBreed.image!.url ?? ""),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Temperament: ${dogBreed.temperament}\nLife Span: ${dogBreed.lifeSpan}",textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
        ],
      ),
    );
  }
}
