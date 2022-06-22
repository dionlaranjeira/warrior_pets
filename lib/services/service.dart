import 'package:dio/dio.dart';
import 'package:warrior_pets/model/dog_breed.dart';
import 'package:warrior_pets/services/end_points.dart';
class Service{

  final dio = Dio();
  final String xApiKey = "c33d7519-26d5-4799-91e7-c8a5fcb500f1";

  Future <List<DogBreed>> fetchDogBreeds(int page, int limit) async {

    Map<String, dynamic> parms = {
      "x-api-key": xApiKey,
      "page":page,
      "limit":limit
    };

    var response = await dio.get(
      EndPoints.urlGetBreed,
      queryParameters: parms,
    );

    if(response.statusCode == 200){
      final listDogBreeds = response.data as List;
      List<DogBreed> dogBreeds = [];

      for(var d in  listDogBreeds){
        dogBreeds.add( DogBreed.fromJson(d));
      }
      return dogBreeds;

    }else{
      throw Exception("Erro fetching breeds");
    }

  }

}