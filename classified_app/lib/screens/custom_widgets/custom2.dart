import 'package:flutter/material.dart';

class Custom2 extends StatelessWidget {
  final String name;
  final num price;
  final String created;
  final String image;

  const Custom2(
      {super.key,
      required this.name,
      required this.price,
      required this.created,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, style: BorderStyle.solid),
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      child: Row(
        children: [
          SizedBox(
              height: 100,
              width: 100,
              child: Image.network(
                image,
                fit: BoxFit.cover,
              )),
          Container(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                RichText(
                    text: TextSpan(children: [
                  const WidgetSpan(
                      child: Icon(
                    Icons.timer_outlined,
                    size: 18,
                    color: Colors.grey,
                  )),
                  TextSpan(
                      text: created,
                      style: const TextStyle(fontSize: 14, color: Colors.grey))
                ])),
                const SizedBox(height: 4),
                Text("\$$price",
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange))
              ],
            ),
          )
        ],
      ),
    );
  }
}
