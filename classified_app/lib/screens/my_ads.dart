import 'package:classified_app/custom_widgets/custom2.dart';
import 'package:classified_app/data/ads_data.dart';
import 'package:classified_app/navigation/const_routes.dart';
import 'package:flutter/material.dart';

class MyAdsScreen extends StatelessWidget {
  const MyAdsScreen({super.key});

  _obtainAds() {
    List result = [];
    for (var element in ads) {
      if (element["createdBy"] == "Abi") {
        result.add(element);
      }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    List userAds = _obtainAds();
    return Scaffold(
        appBar: AppBar(
          title: const Text("My Ads"),
        ),
        backgroundColor: Colors.white,
        body: ListView.builder(
            itemCount: userAds.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, editAdPage,
                      arguments: userAds[index]);
                },
                child: Custom2(
                  name: userAds[index]["title"],
                  price: userAds[index]["price"],
                  created: userAds[index]["createdAt"],
                  image: userAds[index]["images"][0],
                ),
              );
            }));
  }
}
