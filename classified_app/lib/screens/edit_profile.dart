import 'package:classified_app/data/ads_data.dart';
import 'package:classified_app/navigation/const_routes.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  final TextEditingController _nameCtrl =
      TextEditingController(text: users[0]["name"]);
  final TextEditingController _emailCtrl =
      TextEditingController(text: users[0]["email"]);
  final TextEditingController _mobileCtrl =
      TextEditingController(text: users[0]["mobile"]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
      ),
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
        children: [
          const SizedBox(height: 18),
          const CircleAvatar(
            backgroundImage: AssetImage("assets/avatar.jpg"),
            radius: 60,
          ),
          const SizedBox(height: 8),
          Container(
            height: 400,
            width: double.infinity,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                      controller: _nameCtrl,
                      style: const TextStyle(fontSize: 18, height: 1),
                      decoration:
                          const InputDecoration(border: OutlineInputBorder())),
                  const SizedBox(height: 8),
                  TextField(
                      controller: _emailCtrl,
                      style: const TextStyle(fontSize: 18, height: 1),
                      decoration:
                          const InputDecoration(border: OutlineInputBorder())),
                  const SizedBox(height: 8),
                  TextField(
                      controller: _mobileCtrl,
                      style: const TextStyle(fontSize: 18, height: 1),
                      decoration:
                          const InputDecoration(border: OutlineInputBorder())),
                  const SizedBox(height: 24),
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
                            "Update Profile",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ))),
                  const SizedBox(height: 10),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, loginPage, (route) => false);
                      },
                      child: const Text(
                        "Logout",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xfff25723)),
                      ))
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
