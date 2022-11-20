import 'package:flutter/material.dart';

class CreateAdScreen extends StatelessWidget {
  CreateAdScreen({super.key});
  final TextEditingController _titleCtrl = TextEditingController();
  final TextEditingController _priceCtrl = TextEditingController();
  final TextEditingController _mobileCtrl = TextEditingController();
  final TextEditingController _descriptionCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Ad"),
      ),
      backgroundColor: Colors.white,
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 24),
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
            const SizedBox(height: 24),
            TextField(
                controller: _titleCtrl,
                style: const TextStyle(fontSize: 18, height: 1),
                decoration: const InputDecoration(
                    labelText: "Title", border: OutlineInputBorder())),
            const SizedBox(height: 8),
            TextField(
                controller: _priceCtrl,
                style: const TextStyle(fontSize: 18, height: 1),
                decoration: const InputDecoration(
                    labelText: "Price", border: OutlineInputBorder())),
            const SizedBox(height: 8),
            TextField(
                controller: _mobileCtrl,
                style: const TextStyle(fontSize: 18, height: 1),
                decoration: const InputDecoration(
                    labelText: "Contact Number", border: OutlineInputBorder())),
            const SizedBox(height: 8),
            TextField(
                controller: _descriptionCtrl,
                style: const TextStyle(fontSize: 18, height: 4),
                decoration: const InputDecoration(
                    labelText: "Description", border: OutlineInputBorder())),
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
