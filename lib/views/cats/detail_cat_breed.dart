import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:warrior_pets/util/utils.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:warrior_pets/model/bar_chart.dart';

class DetailCat extends StatefulWidget {
  final dynamic catBreed;
  const DetailCat({Key? key, required this.catBreed}) : super(key: key);

  @override
  State<DetailCat> createState() => _DetailCatState();
}

class _DetailCatState extends State<DetailCat> {
  String urlPhotoNull = "https://www.creativefabrica.com/wp-content/uploads/2021/01/26/Cat-Icon-Graphics-8071439-1.jpg";

  final List<BarChart> data = [
    BarChart("teste1", 5, charts.ColorUtil.fromDartColor(Colors.blueAccent)),
    BarChart("teste2", 10, charts.ColorUtil.fromDartColor(Colors.black)),
    BarChart("teste3", 51, charts.ColorUtil.fromDartColor(Colors.red)),
    BarChart("teste4", 23, charts.ColorUtil.fromDartColor(Colors.green)),
  ];

  @override
  Widget build(BuildContext context) {
    List<charts.Series<BarChart, String>> series = [
      charts.Series(
        id: "cat",
        data: data,
        domainFn: (BarChart series, _)=>series.title,
        measureFn: (BarChart series, _)=>series.value,
        colorFn: (BarChart series, _)=>series.color,
      ),
    ];
    return
  Scaffold(
    appBar: AppBar(
      title: Text(widget.catBreed.name),
    ),
    body:   SingleChildScrollView(
      child:
      Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            ListTile(
              leading: SvgPicture.asset(Utils.urlIconCat, width: 50),
              title: Text("Origin: "+widget.catBreed.origin),
              subtitle: Text(
                widget.catBreed.temperament,
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ),
            Hero(
              tag: widget.catBreed.id!,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  child: Image.network(widget.catBreed.image!.url ?? urlPhotoNull),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.catBreed.description +"\nLife Span: " + widget.catBreed.lifeSpan, textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ),

            Container(
              height: 150,
              padding: EdgeInsets.all(16),
              child: charts.BarChart(series, animate: true),)

          ],
        ),
      ),
    ),
    bottomNavigationBar:   ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.blue,
          onPrimary: Colors.white,
          shadowColor: Colors.blueAccent,
          elevation: 3,
        ),
        onPressed: (){Navigator.pop(context);},
        child:  Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.arrow_back_ios),
              SizedBox(width: 10),
              Text("Back", style: TextStyle(fontSize: 18)),
            ],
          ),
        )),
  );}
}
