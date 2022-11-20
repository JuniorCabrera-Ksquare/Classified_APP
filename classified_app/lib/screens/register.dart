import 'package:classified_app/navigation/const_routes.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Column(
          children: [
            Expanded(
              child: Image.asset(
                "assets/app.jpg",
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Container(
              height: 400,
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const TextField(
                        style: TextStyle(fontSize: 18, height: 1),
                        decoration: InputDecoration(
                            labelText: "Full Name",
                            border: OutlineInputBorder())),
                    const SizedBox(height: 8),
                    const TextField(
                        style: TextStyle(fontSize: 18, height: 1),
                        decoration: InputDecoration(
                            labelText: "Email Address",
                            border: OutlineInputBorder())),
                    const SizedBox(height: 8),
                    const TextField(
                        style: TextStyle(fontSize: 18, height: 1),
                        decoration: InputDecoration(
                            labelText: "Mobile Number",
                            border: OutlineInputBorder())),
                    const SizedBox(height: 8),
                    const TextField(
                        style: TextStyle(fontSize: 18, height: 1),
                        decoration: InputDecoration(
                            labelText: "Password",
                            border: OutlineInputBorder())),
                    const SizedBox(height: 12),
                    SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, homePage);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xfff25723)),
                            child: const Text(
                              "Register Now",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            ))),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, loginPage);
                        },
                        child: const Text(
                          "Already have an account?",
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
      ),
    );
  }
}
