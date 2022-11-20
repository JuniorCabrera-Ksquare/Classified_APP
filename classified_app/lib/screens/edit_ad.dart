import 'package:flutter/material.dart';

class EditAdScreen extends StatelessWidget {
  final dynamic data;
  EditAdScreen({super.key, required this.data});
  final TextEditingController _titleCtrl = TextEditingController();
  final TextEditingController _priceCtrl = TextEditingController();
  final TextEditingController _mobileCtrl = TextEditingController();
  final TextEditingController _descriptionCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _titleCtrl.text = data["title"];
    _priceCtrl.text = data["price"].toString();
    _mobileCtrl.text = data["mobile"];
    _descriptionCtrl.text = data["description"];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Ad"),
      ),
      backgroundColor: Colors.white,
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            OutlinedButton(
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Column(
                  children: const [
                    Icon(
                      Icons.add_a_photo_outlined,
                      size: 40,
                      color: Colors.black,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Tap to Upload",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 100,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: data["images"].length,
                itemBuilder: ((context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.grey, style: BorderStyle.solid),
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      color: Colors.white,
                    ),
                    margin: const EdgeInsets.all(4),
                    padding: const EdgeInsets.all(4),
                    width: 100,
                    child: Image.network(
                      data["images"][index],
                      fit: BoxFit.cover,
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
                controller: _titleCtrl,
                style: const TextStyle(fontSize: 18, height: 1),
                decoration:
                    const InputDecoration(border: OutlineInputBorder())),
            const SizedBox(height: 8),
            TextField(
                controller: _priceCtrl,
                style: const TextStyle(fontSize: 18, height: 1),
                decoration:
                    const InputDecoration(border: OutlineInputBorder())),
            const SizedBox(height: 8),
            TextField(
                controller: _mobileCtrl,
                style: const TextStyle(fontSize: 18, height: 1),
                decoration:
                    const InputDecoration(border: OutlineInputBorder())),
            const SizedBox(height: 8),
            TextField(
                maxLines: 3,
                controller: _descriptionCtrl,
                style: const TextStyle(fontSize: 18, height: 1),
                decoration:
                    const InputDecoration(border: OutlineInputBorder())),
            const SizedBox(height: 12),
            SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xfff25723)),
                    child: const Text(
                      "Submit Ad",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    )))
          ],
        ),
      )),
    );
  }
}
