import 'package:flutter/material.dart';
import 'package:warrior_pets/model/cat_breed.dart';
import 'package:warrior_pets/view_model/list_cats_breeds.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:warrior_pets/views/cats/detail_cat_breed.dart';

class ShowCats extends StatefulWidget {
  const ShowCats({Key? key}) : super(key: key);

  @override
  State<ShowCats> createState() => _ShowCatsState();
}

class _ShowCatsState extends State<ShowCats> {

  String urlPhotoNull = "https://www.creativefabrica.com/wp-content/uploads/2021/01/26/Cat-Icon-Graphics-8071439-1.jpg";

  final ScrollController _scrollController = ScrollController();
  int pageNumber = 0;
  ListCatsBreedsViewModel listCatsBreedsViewModel = ListCatsBreedsViewModel();

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
      body:FutureBuilder(
        future: listCatsBreedsViewModel.fetchCatBreeds(pageNumber, 50),
        builder: (context, snapshot){

          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.active:
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text("Loading data...",style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(height: 30),
                  Center(child: CircularProgressIndicator()),
                ],
              );
            case ConnectionState.done:
              return MasonryGridView.count(
                controller: _scrollController,
                itemCount: listCatsBreedsViewModel.catBreeds!.length,
                crossAxisCount: 2,
                itemBuilder: (context, index) {
                  return
                    cardCatBreed(listCatsBreedsViewModel.catBreeds![index].catBreed!);
                  },
              );
            case ConnectionState.none:
              return  const Center(child: Text('Internet connection problems.'));
            default:
              return const Center(child: Text('Problems receiving data.'));
          }
        },
      ),
    );
  }

  InkWell cardCatBreed(CatBreed catBreed) {

    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context)=>DetailCat(catBreed: catBreed,))),
      child: Card(
        elevation: 10,
        shape:  RoundedRectangleBorder(
            side: const BorderSide(color: Colors.blue, width: 1),
            borderRadius: BorderRadius.circular(4.0)),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            ListTile(
              title: Text(catBreed.name ?? "", textAlign: TextAlign.center,),
            ),
            // Image.network(dogBreed.image!.url ?? urlPhotoNull),
            Hero(
              // tag: catBreed.referenceImageId! ?? "",
              tag: catBreed.id!,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  child: Image.network(catBreed.image!.url ?? urlPhotoNull),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}