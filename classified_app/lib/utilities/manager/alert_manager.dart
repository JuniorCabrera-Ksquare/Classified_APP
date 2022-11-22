import 'package:classified_app/utilities/constants.dart';
import 'package:flutter/material.dart';

class AlertManager {
  displaySnackbar(context, message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message),
        backgroundColor: Constants().appColor,
        duration: const Duration(milliseconds: 3000)));
  }
}
