import 'package:classified_app/models/user_model.dart';
import 'package:classified_app/services/auth_service.dart';
import 'package:classified_app/utilities/constants.dart';
import 'package:classified_app/utilities/manager/alert_manager.dart';
import 'package:classified_app/utilities/navigation/const_routes.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();
  bool _isObscure = true;

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
              height: 370,
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const SizedBox(height: 12),
                    TextField(
                        controller: _emailCtrl,
                        style: const TextStyle(fontSize: 18),
                        decoration: const InputDecoration(
                            labelText: "Email Address",
                            border: OutlineInputBorder())),
                    const SizedBox(height: 8),
                    TextField(
                        controller: _passwordCtrl,
                        obscureText: _isObscure,
                        style: const TextStyle(fontSize: 18),
                        decoration: InputDecoration(
                          labelText: "Password",
                          border: const OutlineInputBorder(),
                          suffixIcon: IconButton(
                              onPressed: (() {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              }),
                              icon: Icon(_isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off)),
                        )),
                    const SizedBox(height: 12),
                    SizedBox(
                        width: double.infinity,
                        child: RoundedLoadingButton(
                            onPressed: () async {
                              if (_emailCtrl.text.isEmpty ||
                                  _passwordCtrl.text.isEmpty) {
                                AlertManager().displaySnackbar(context,
                                    "Please, fill out all the fields.");
                              } else {
                                UserModel user = UserModel(
                                    email: _emailCtrl.text,
                                    password: _passwordCtrl.text);
                                await AuthService().userLogin(context, user)
                                    ? Navigator.pushReplacementNamed(
                                        context, homePage)
                                    : _btnController.error();
                              }
                            },
                            color: Constants().appColor,
                            borderRadius: 5,
                            controller: _btnController,
                            resetDuration: const Duration(milliseconds: 3600),
                            resetAfterDuration: true,
                            errorColor: Constants().appColor,
                            successColor: Constants().appColor,
                            height: 60,
                            width: 400,
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w600),
                            ))),
                    const SizedBox(height: 8),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, registerPage);
                        },
                        child: Text(
                          "Don't have any account?",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Constants().appColor),
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
