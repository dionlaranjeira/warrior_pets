import 'package:warrior_pets/model/dog_breed.dart';
import 'package:warrior_pets/services/service.dart';

class ListDogsBreedsViewModel{
  List<DogsBreedsViewModel>? dogBreeds;
  Future<void> fetchDogBreeds(int page, int limit) async {
    final apiResult = await Service().fetchDogBreeds(page, limit);
    dogBreeds = apiResult.map((e) => DogsBreedsViewModel(e)).toList();
  }
}

class DogsBreedsViewModel {
  final DogBreed? dogBreed;
  DogsBreedsViewModel(this.dogBreed);
}