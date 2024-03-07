import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme{
  static ThemeData lightThem(BuildContext context) => ThemeData(
    primarySwatch: Colors.deepPurple,
    fontFamily: GoogleFonts.poppins().fontFamily,
    cardColor: Colors.white,
    canvasColor: creamColor,
    primaryColor: darkblueColor,
    hoverColor: darkblueColor,
  appBarTheme: AppBarTheme(
  color: Colors.white,
  elevation: 0.0,
  iconTheme: IconThemeData(color: Colors.black),
  titleTextStyle: Theme.of(context).textTheme.headline5,
  ),
  );

  static ThemeData darkThem(BuildContext context) => ThemeData(
    // brightness: Brightness.dark,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.black,
      canvasColor: darkCreamColor,
      primaryColor: Colors.white,
      hoverColor: lightblueColor,
      buttonTheme: ButtonThemeData(buttonColor: darkCreamColor),
      appBarTheme: AppBarTheme(
        color: Colors.black,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: Theme.of(context).textTheme.headline5,
      ),
      );

  static Color creamColor = Color(0xfff5f5f5);
  static Color darkCreamColor = Vx.gray900;
  static Color darkblueColor = Color(0xff403b58);
  static Color lightblueColor = Vx.blue600;
}