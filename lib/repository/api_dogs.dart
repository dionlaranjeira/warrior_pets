import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:warrior_pets/repository/end_points.dart';
class ApiDogs{

  final dio = Dio();
  final String x_api_key = "c33d7519-26d5-4799-91e7-c8a5fcb500f1";

  Future <List<Map>> getDogBreeds(int page, int limit) async {

    Map<String, dynamic> parms = {
      "x-api-key": x_api_key,
      "page":page,
      "limit":limit
    };

    var response = await dio.get(
      EndPoints.urlGetBreed,
      queryParameters: parms,

    );
    if (kDebugMode) {
      print(response);
    }

    final listBreeds = response.data as List;

    List<Map> breeds = [];

    for(var b in  listBreeds){
      final breed = b;
      breeds.add(breed);
    }

    return breeds;
  }

}