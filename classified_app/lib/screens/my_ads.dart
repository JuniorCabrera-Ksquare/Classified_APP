import 'package:classified_app/models/ads_model.dart';
import 'package:classified_app/screens/custom_widgets/custom2.dart';
import 'package:classified_app/services/ads_service.dart';
import 'package:classified_app/utilities/constants.dart';
import 'package:classified_app/utilities/functions.dart';
import 'package:classified_app/utilities/navigation/const_routes.dart';
import 'package:flutter/material.dart';

class MyAdsScreen extends StatefulWidget {
  const MyAdsScreen({super.key});

  @override
  State<MyAdsScreen> createState() => _MyAdsScreenState();
}

class _MyAdsScreenState extends State<MyAdsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("My Ads"),
        ),
        backgroundColor: Colors.white,
        body: FutureBuilder(
          future: AdsService().fetcMyAds(context),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              List<AdsModel> userAds = snapshot.data;
              return ListView.builder(
                  itemCount: userAds.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, editAdPage,
                                arguments: userAds[index])
                            .then((value) {
                          setState(() {});
                        });
                      },
                      child: Custom2(
                        name: userAds[index].title!,
                        price: userAds[index].price!,
                        created: Functions()
                            .timeAgoCalculator(userAds[index].created!),
                        image: userAds[index].images![0],
                      ),
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(
                  color: Constants().appColor,
                ),
              );
            }
          },
        ));
  }
}
