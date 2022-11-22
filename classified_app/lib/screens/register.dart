import 'package:classified_app/models/user_model.dart';
import 'package:classified_app/services/auth_service.dart';
import 'package:classified_app/utilities/constants.dart';
import 'package:classified_app/utilities/navigation/const_routes.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();
  final TextEditingController _nameCtrl = TextEditingController();
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _mobileCtrl = TextEditingController();
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
                        decoration: const InputDecoration(
                            labelText: "Full Name",
                            border: OutlineInputBorder())),
                    const SizedBox(height: 8),
                    TextField(
                        controller: _emailCtrl,
                        style: const TextStyle(fontSize: 18, height: 1),
                        decoration: const InputDecoration(
                            labelText: "Email Address",
                            border: OutlineInputBorder())),
                    const SizedBox(height: 8),
                    TextField(
                        controller: _mobileCtrl,
                        style: const TextStyle(fontSize: 18, height: 1),
                        decoration: const InputDecoration(
                            labelText: "Mobile Number",
                            border: OutlineInputBorder())),
                    const SizedBox(height: 8),
                    TextField(
                        controller: _passwordCtrl,
                        style: const TextStyle(fontSize: 18, height: 1),
                        obscureText: _isObscure,
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
                            suffixIconColor: Constants().appColor)),
                    const SizedBox(height: 12),
                    RoundedLoadingButton(
                        onPressed: () async {
                          UserModel user = UserModel(
                              name: _nameCtrl.text,
                              email: _emailCtrl.text,
                              password: _passwordCtrl.text,
                              mobile: _mobileCtrl.text);
                          if (await AuthService().userRegister(context, user)) {
                            await AuthService().userLogin(context, user)
                                ? Navigator.pushReplacementNamed(
                                    context, homePage)
                                : _btnController.error();
                          } else {
                            _btnController.error();
                          }
                        },
                        width: 400,
                        color: Constants().appColor,
                        borderRadius: 5,
                        controller: _btnController,
                        resetDuration: const Duration(milliseconds: 3600),
                        resetAfterDuration: true,
                        errorColor: Constants().appColor,
                        successColor: Constants().appColor,
                        child: const Text(
                          "Register Now",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        )),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, loginPage);
                        },
                        child: Text(
                          "Already have an account?",
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
