import 'package:flutter_test/flutter_test.dart';
import 'package:warrior_pets/repository/api_dogs.dart';

void main() {

  ApiDogs apiDogs = ApiDogs();

  test("deve retornar um List<Map>", () async {
    final List<Map> response = await apiDogs.getDogBreeds(0, 50);
  });

}