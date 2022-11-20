import 'package:url_launcher/url_launcher.dart';
import 'package:classified_app/navigation/const_routes.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  final dynamic data;
  const ProductDetailScreen({super.key, required this.data});

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
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            Text(
              data["title"],
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              "\$${data["price"]}",
              style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: Color(0xfff25723)),
            ),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, imageViewerPage, arguments: data);
              },
              child: Image.network(
                data["images"][0],
                fit: BoxFit.cover,
                height: 300,
                width: double.infinity,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                RichText(
                    text: TextSpan(children: [
                  const WidgetSpan(
                      child: Icon(
                    Icons.person_outline,
                    size: 19,
                    color: Color.fromARGB(255, 58, 58, 58),
                  )),
                  TextSpan(
                      text: data["createdBy"],
                      style: const TextStyle(
                          fontSize: 16, color: Color.fromARGB(255, 58, 58, 58)))
                ])),
                const SizedBox(width: 16),
                RichText(
                    text: TextSpan(children: [
                  const WidgetSpan(
                      child: Icon(
                    Icons.timer_outlined,
                    size: 18,
                    color: Color.fromARGB(255, 58, 58, 58),
                  )),
                  TextSpan(
                      text: data["createdAt"],
                      style: const TextStyle(
                          fontSize: 16, color: Color.fromARGB(255, 58, 58, 58)))
                ])),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              data["description"],
              style: const TextStyle(
                  fontSize: 18, color: Color.fromARGB(255, 44, 44, 44)),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 20),
            SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      _openURL('tel:+97798345348734');
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xfff25723)),
                    child: const Text(
                      "Contact Seller",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    )))
          ],
        ),
      ),
    );
  }
}
