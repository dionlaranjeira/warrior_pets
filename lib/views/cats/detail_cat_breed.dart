import 'package:flutter/material.dart';
import 'package:warrior_pets/util/colors_app.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:warrior_pets/model/bar_chart.dart';

class DetailCat extends StatefulWidget {
  final dynamic catBreed;

  const DetailCat({Key? key, required this.catBreed}) : super(key: key);

  @override
  State<DetailCat> createState() => _DetailCatState();
}

class _DetailCatState extends State<DetailCat> {
  String urlPhotoNull =
      "https://www.creativefabrica.com/wp-content/uploads/2021/01/26/Cat-Icon-Graphics-8071439-1.jpg";

  @override
  Widget build(BuildContext context) {
    final List<BarChart> data = [
      BarChart("Affection", widget.catBreed.affectionLevel,
          charts.ColorUtil.fromDartColor(Colors.red)),
      BarChart("Energy", widget.catBreed.energyLevel,
          charts.ColorUtil.fromDartColor(Colors.yellow)),
      BarChart("Grooming", widget.catBreed.grooming,
          charts.ColorUtil.fromDartColor(Colors.green)),
      BarChart("Intelligence", widget.catBreed.intelligence,
          charts.ColorUtil.fromDartColor(Colors.purple)),
    ];

    List<charts.Series<BarChart, String>> series = [
      charts.Series(
        id: widget.catBreed.id,
        data: data,
        domainFn: (BarChart series, _) => series.title,
        measureFn: (BarChart series, _) => series.value,
        colorFn: (BarChart series, _) => series.color,
      ),
    ];

    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsApp.secundarybackground,
          title: textAppBar(context),
          automaticallyImplyLeading: false,
        ),
        body: MediaQuery(
          data: const MediaQueryData(),
          child: Scaffold(
            backgroundColor: ColorsApp.secundarybackground,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Image.network(widget.catBreed.image!.url ?? urlPhotoNull),
                      Positioned(
                        bottom: -50,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: containerInforsCat(context),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 90),
                  graphicInforCat(series),
                  paddingExtraInforsCats(),
                  const SizedBox(height: 20),
                  btnBack(context),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Container textAppBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: MediaQuery.of(context).size.width * 0.8,
      child: Text(widget.catBreed.name,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: ColorsApp.primaryColor)),
    );
  }

  Container containerInforsCat(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(32)),
        boxShadow: [
          BoxShadow(color: ColorsApp.background, spreadRadius: 4),
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Text(
              widget.catBreed.temperament,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ColorsApp.primaryColor,
                  fontSize: 14),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.pin_drop_outlined, size: 14),
              const SizedBox(
                width: 10,
              ),
              Text(
                widget.catBreed.origin,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.calendar_today, size: 14),
              const SizedBox(
                width: 10,
              ),
              Text(
                widget.catBreed.lifeSpan + " years",
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container graphicInforCat(List<charts.Series<BarChart, String>> series) {
    return Container(
        height: 160,
        padding: const EdgeInsets.only(bottom: 16),
        child: charts.BarChart(series, animate: true));
  }

  Padding paddingExtraInforsCats() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Text(
        widget.catBreed.description,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: ColorsApp.primaryColor,
          fontSize: 16,
        ),
      ),
    );
  }

  ElevatedButton btnBack(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: const Text("Back"),
      style: ElevatedButton.styleFrom(
          primary: ColorsApp.secondaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
          textStyle:
          const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
    );
  }

}
