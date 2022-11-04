import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:warrior_pets/util/colors_app.dart';

class DetailDogBreed extends StatefulWidget {
  final dynamic dogBreed;

  const DetailDogBreed({Key? key, required this.dogBreed}) : super(key: key);

  @override
  _DetailDogBreedState createState() => _DetailDogBreedState();
}

class _DetailDogBreedState extends State<DetailDogBreed> {
  String urlPhotoNull =
      "https://www.pngall.com/wp-content/uploads/10/Pet-Silhouette.png";

  late final BannerAd? myBanner;
  final AdSize adSize = const AdSize(height: 100, width: 400);
  final BannerAdListener listener = BannerAdListener(
    // Called when an ad is successfully received.
    onAdLoaded: (Ad ad) => debugPrint('Ad loaded.'),
    // Called when an ad request failed.
    onAdFailedToLoad: (Ad ad, LoadAdError error) {
      // Dispose the ad here to free resources.
      ad.dispose();
      debugPrint('Ad failed to load: $error');
    },
    // Called when an ad opens an overlay that covers the screen.
    onAdOpened: (Ad ad) => debugPrint('Ad opened.'),
    // Called when an ad removes an overlay that covers the screen.
    onAdClosed: (Ad ad) => debugPrint('Ad closed.'),
    // Called when an impression occurs on the ad.
    onAdImpression: (Ad ad) => debugPrint('Ad impression.'),
  );

  InterstitialAd? interstitialAd;

  @override
  void initState() {
    super.initState();

    setState(() {
      myBanner = BannerAd(
        adUnitId: Platform.isAndroid == true
            ? "ca-app-pub-6151915718502479/3657357252"
            : "ca-app-pub-6151915718502479~8610339029",
        size: adSize,
        request: const AdRequest(),
        listener: listener,
      );
      myBanner!.load();
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
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
                    CachedNetworkImage(
                      imageUrl: widget.dogBreed.image!.url,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                    Positioned(
                      bottom: -50,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: containerInforsDog(context),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 90),
                paddingExtraInforsDogs(),
                const SizedBox(height: 20),
                btnBack(context),
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      myBanner != null
                          ? Container(
                              alignment: Alignment.center,
                              child: AdWidget(ad: myBanner!),
                              width: double.infinity,
                              height: 100,
                            )
                          : Container(),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ));

  Padding paddingExtraInforsDogs() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Text(
        "Temperament: " + widget.dogBreed.temperament,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: ColorsApp.primaryColor,
          fontSize: 18,
        ),
      ),
    );
  }

  Container textAppBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: MediaQuery.of(context).size.width * 0.8,
      child: Text(widget.dogBreed.name,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: ColorsApp.primaryColor)),
    );
  }

  Container containerInforsDog(BuildContext context) {
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
          Text(
            "Dog Category: " + widget.dogBreed.breedGroupString,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: ColorsApp.primaryColor,
                fontSize: 14),
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Text(widget.dogBreed.bredForString,
                  textAlign: TextAlign.center)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.pin_drop_outlined, size: 14),
              const SizedBox(
                width: 10,
              ),
              Text(
                widget.dogBreed.originString,
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
                widget.dogBreed.lifeSpan,
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ],
          ),
        ],
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
          backgroundColor: ColorsApp.secondaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
          textStyle:
              const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
    );
  }
}
