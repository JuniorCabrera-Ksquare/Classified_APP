import 'package:classified_app/data/ads_data.dart';
import 'package:classified_app/navigation/const_routes.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(children: [
                const SizedBox(
                  height: 40,
                  width: 40,
                  child: CircleAvatar(
                      backgroundImage: AssetImage("assets/avatar.jpg")),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          users[0]["name"],
                          style: const TextStyle(
                              fontSize: 19, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 4),
                        Text(users[0]["mobile"],
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(255, 82, 82, 82))),
                      ]),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, editProfilePage);
                    },
                    child: const Text(
                      "Edit",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xfff25723)),
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
      ),
    );
  }
}
