import 'package:flutter_test/flutter_test.dart';
import 'package:warrior_pets/model/dog_breed.dart';
import 'package:warrior_pets/repository/api_dogs.dart';

void main() {

  ApiDogs apiDogs = ApiDogs();

  test("deve retornar uma List<DogBreed>", () async {
    final List<DogBreed> response = await apiDogs.getDogBreeds(0, 50);
  });

}