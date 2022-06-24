import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:warrior_pets/util/colors_app.dart';
import 'package:warrior_pets/util/utils.dart';
import 'package:warrior_pets/views/cats/show_cats.dart';
import 'package:warrior_pets/views/dogs/show_dogs.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget  {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: 2,
        vsync: this);

  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("HOME"),),
      body: TabBarView(
        controller: _tabController,
        children: const [
          ShowDogs(),
          ShowCats(),
        ],
      ),

        bottomNavigationBar: ConvexAppBar(
          backgroundColor: ColorsApp.secondaryColor,
          controller: _tabController,
          items:  [
            TabItem(icon: SvgPicture.asset(Utils.urlIconDog , color: ColorsApp.primaryColor)),
            TabItem(icon: SvgPicture.asset(Utils.urlIconCat, color: ColorsApp.primaryColor)),
          ],
          initialActiveIndex: 0, //optional, default as 0
        )

    );
  }
}
