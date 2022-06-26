import 'package:flutter/material.dart';
import 'package:warrior_pets/util/utils.dart';
class CustomSearchDelegate extends SearchDelegate<String>{

  String _type;

  CustomSearchDelegate(this._type);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return[
      IconButton(
          onPressed: (){query = "";},
          icon: const Icon(Icons.clear)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: (){close(context, "");},
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    close(context, query);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> listDogs = Utils.allDogBreeds;
    List<String> listSearch = [];
    if(_type == Utils.searchDog) {
      listSearch.addAll(listDogs);
    }

    if(query.isNotEmpty){
      listSearch.where(
          (text) => text.toLowerCase().startsWith(query.toLowerCase())).toList();
          return ListView.builder(
          itemCount: listSearch.length,
          itemBuilder: (context, index){
              return ListTile(
                onTap: (){
                  close(context, listSearch[index]);
                },
                title: Text(listSearch[index]),
              );
          });
    }
    return Container();
  }

}