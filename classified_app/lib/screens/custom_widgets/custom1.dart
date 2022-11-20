import 'package:flutter/material.dart';

class Custom1 extends StatelessWidget {
  final String name;
  final num price;
  final String description;
  final String image;

  const Custom1(
      {super.key,
      required this.name,
      required this.price,
      required this.description,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      child: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.network(
              image,
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.only(left: 12),
              height: 65,
              color: const Color.fromARGB(255, 66, 66, 66).withOpacity(0.7),
              child: Row(children: [
                Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text("\$$price",
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xfff25723))),
                      ]),
                )
              ]),
            ),
          )
        ],
      ),
    );
  }
}
