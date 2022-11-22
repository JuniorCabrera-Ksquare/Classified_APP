import 'package:classified_app/models/user_model.dart';
import 'package:classified_app/services/profile_service.dart';
import 'package:classified_app/utilities/constants.dart';
import 'package:classified_app/utilities/navigation/const_routes.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  _openURL(url) async {
    url = Uri.parse(url);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      debugPrint("Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder(
          future: ProfileService().readProfile(context),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              UserModel user = snapshot.data;
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(children: [
                        SizedBox(
                          height: 40,
                          width: 40,
                          child: CircleAvatar(
                              backgroundImage: NetworkImage(user.imgURL!)),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  user.name!,
                                  style: const TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(height: 4),
                                Text(user.mobile!,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color:
                                            Color.fromARGB(255, 82, 82, 82))),
                              ]),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, editProfilePage)
                                  .then((value) {
                                setState(() {});
                              });
                            },
                            child: Text(
                              "Edit",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Constants().appColor),
                            ))
                      ]),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.add_chart,
                            size: 26.0,
                            color: Color.fromARGB(255, 117, 117, 117),
                          ),
                          const SizedBox(
                            width: 22,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, myAdsPage);
                            },
                            child: const Text(
                              "My Ads",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 54, 54, 54)),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.person_outline,
                            size: 26.0,
                            color: Color.fromARGB(255, 117, 117, 117),
                          ),
                          const SizedBox(
                            width: 22,
                          ),
                          TextButton(
                            onPressed: () {
                              _openURL("https://appmaking.com/about");
                            },
                            child: const Text(
                              "About us",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 54, 54, 54)),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.add_chart,
                            size: 26.0,
                            color: Color.fromARGB(255, 117, 117, 117),
                          ),
                          const SizedBox(
                            width: 22,
                          ),
                          TextButton(
                            onPressed: () {
                              _openURL("https://appmaking.com/contact");
                            },
                            child: const Text(
                              "Contact us",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 54, 54, 54)),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(
                  color: Constants().appColor,
                ),
              );
            }
          }),
    );
  }
}
