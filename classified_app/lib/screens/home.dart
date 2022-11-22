import 'package:classified_app/models/ads_model.dart';
import 'package:classified_app/models/user_model.dart';
import 'package:classified_app/screens/custom_widgets/custom1.dart';
import 'package:classified_app/data/ads_data.dart';
import 'package:classified_app/services/ads_service.dart';
import 'package:classified_app/services/profile_service.dart';
import 'package:classified_app/utilities/navigation/const_routes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final dynamic _data = ads;
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ads Listing"),
        actions: <Widget>[
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, settingsPage);
              },
              child: FutureBuilder(
                future: ProfileService().readProfile(context),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasData) {
                    UserModel user = snapshot.data;
                    return CircleAvatar(
                      backgroundImage: NetworkImage(user.imgURL!),
                    );
                  } else {
                    return const CircleAvatar(
                        backgroundImage: AssetImage("assets/noimg.jpg"));
                  }
                },
              ))
        ],
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: AdsService().fetchAllAds(context),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            List<AdsModel> fecthedAds = snapshot.data!;
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.7),
              itemCount: fecthedAds.length,
              itemBuilder: ((context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, productDetailPage,
                        arguments: fecthedAds[index]);
                  },
                  child: Custom1(
                    name: fecthedAds[index].title!,
                    price: fecthedAds[index].price!,
                    description: fecthedAds[index].description!,
                    image: fecthedAds[index].images![0],
                  ),
                );
              }),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, createAdPage);
        },
        backgroundColor: const Color(0xfff25723),
        child: const Icon(Icons.add_a_photo),
      ),
    );
  }
}
