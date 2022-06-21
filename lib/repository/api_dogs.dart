import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:warrior_pets/model/dog_breed.dart';
import 'package:warrior_pets/repository/end_points.dart';
class ApiDogs{

  final dio = Dio();
  final String x_api_key = "c33d7519-26d5-4799-91e7-c8a5fcb500f1";

  Future <List<DogBreed>> getDogBreeds(int page, int limit) async {

    Map<String, dynamic> parms = {
      "x-api-key": x_api_key,
      "page":page,
      "limit":limit
    };

    var response = await dio.get(
      EndPoints.urlGetBreed,
      queryParameters: parms,

    );

    if(response.statusCode == 200){
      final json = jsonDecode(response.data) as List<dynamic>;
      final listResult = json.map((e) => DogBreed.fromJson(e)).toList();
      return listResult;
    }else{
      throw Exception("Erro fetching breeds");
    }

  }

}