import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImageViewerScreen extends StatelessWidget {
  final dynamic data;
  const ImageViewerScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false, actions: [
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.close,
              size: 30,
            ))
      ]),
      backgroundColor: Colors.black,
      body: Center(
        child: CarouselSlider.builder(
          options: CarouselOptions(
            height: 400,
            viewportFraction: 1,
          ),
          itemCount: data["images"].length,
          itemBuilder: (context, itemIndex, pageViewIndex) {
            return Container(
              width: double.infinity,
              color: Colors.grey,
              child: Image.network(
                data["images"][itemIndex],
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      ),
    );
  }
}
