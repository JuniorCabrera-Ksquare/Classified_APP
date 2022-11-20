import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScreenTheme {
  var theme = ThemeData(
    textTheme: GoogleFonts.robotoTextTheme(),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      elevation: 0,
      titleTextStyle: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
    ),
  );
}
