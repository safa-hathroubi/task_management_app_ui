import 'package:flutter/material.dart';

class WarmPalette {
  static const Color primary = Color.fromRGBO(244, 67, 54, 1);
  static const Color primaryDark = Color.fromARGB(255, 126, 23, 23);
  static const Color darkwhite = Color.fromARGB(255, 237, 237, 237);
  static const Color lightgray = Color(0xFFE0E0E0);
  static const Color darkgray = Color.fromARGB(255, 130, 130, 130);
  static const Color darkred = Color.fromARGB(255, 19, 5, 4);
  static const gradient1 = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        WarmPalette.darkred,
        WarmPalette.primaryDark,
        WarmPalette.primary,
      ]);
}

class RosyPalette {
  static const Color darkBlue = Color.fromRGBO(24, 24, 32, 1);
  static const Color fucsia = Color.fromRGBO(187, 63, 221, 1);
  static const Color pink = Color.fromRGBO(251, 109, 169, 1);
  static const Color peachy = Color.fromRGBO(255, 159, 124, 1);
  static const Color darkGrey = Color.fromRGBO(52, 51, 67, 1);
  static const Color white = Colors.white;
}


class FigmaPalette {
  static const Color darkBlue = Color.fromRGBO(24, 24, 32, 1);
  static const Color blue = Color.fromRGBO(13, 166, 194, 1);
  static const Color purple = Color.fromRGBO(123, 120, 170, 1);
  static const Color yellow = Color.fromRGBO(255, 194, 57, 1);
  static const Color red = Color.fromRGBO(227, 74, 53, 1);
  static const Color green = Color.fromRGBO(97, 222, 112, 1);
  static const Color transparentRed = Color.fromRGBO(181, 20, 20, 0.2);
  static const Color transparentGrey = Color.fromRGBO(181, 181, 181, 0.2);
  static const Color grey = Color.fromRGBO(130, 130, 130, 0.2);
  static const Color darkGrey = Color.fromRGBO(84, 84, 84, 0.2);
  static const Color darkDarkGrey = Color.fromRGBO(51, 51, 51, 0.2);
  static const Color lightGrey = Color.fromRGBO(239, 239, 239, 1);
  static const Color lightDarkGrey = Color.fromRGBO(218, 218, 218, 1.0);
  static const Color transparentGrey2 = Color.fromRGBO(69, 69, 69, 0.5);
  static const Color white = Colors.white;
}