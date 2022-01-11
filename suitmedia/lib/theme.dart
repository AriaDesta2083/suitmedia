import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

Color primaryColor = Color(0xFF2B637B);
Color iconColor = Color(0xFF554AF0);
Color shadowColor = Color(0xFFE2E3E4);

TextStyle myButtonTextStyle = GoogleFonts.poppins(
    fontWeight: FontWeight.w500, color: Colors.white, fontSize: 14);

TextStyle myAppTextStyle = GoogleFonts.poppins(
    fontWeight: FontWeight.w600, color: Colors.black, fontSize: 18);

ThemeData mytheme() {
  return ThemeData(
      inputDecorationTheme: inputDecorationTheme(),
      appBarTheme: myAppBar(),
      textTheme: GoogleFonts.poppinsTextTheme());
}

AppBarTheme myAppBar() {
  return AppBarTheme(
    centerTitle: true,
    backgroundColor: Colors.white,
    elevation: 1,
    shadowColor: shadowColor,
    iconTheme: IconThemeData(color: iconColor),
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    titleTextStyle: myAppTextStyle,
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: const BorderSide(color: Colors.white),
  );
  return InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    fillColor: Colors.white,
    filled: true,
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}
