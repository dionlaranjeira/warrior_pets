import 'package:warrior_pets/model/cat_breed.dart';
import 'package:warrior_pets/services/service.dart';

class ListCatsBreedsViewModel{
  List<CatsBreedsViewModel>? catBreeds;
  Future<void> fetchCatBreeds(int page, int limit) async {
    final apiResult = await Service().fetchCatBreeds(page, limit);
    catBreeds = apiResult.map((e) => CatsBreedsViewModel(e)).toList();
  }

  Future<void> searchCatBreeds(String query) async {
    final apiResult = await Service().searchCatBreeds(query);
    catBreeds = apiResult.map((e) => CatsBreedsViewModel(e)).toList();
  }

}

class CatsBreedsViewModel {
  final CatBreed? catBreed;
  CatsBreedsViewModel(this.catBreed);
}