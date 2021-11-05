import 'package:flutter/material.dart';

class CustomColors {
  static final Map<int, Color> darkRedColor = {
    50: const Color.fromRGBO(120, 14, 20, .1),
    100: const Color.fromRGBO(120, 14, 20, .2),
    200: const Color.fromRGBO(120, 14, 20, .3),
    300: const Color.fromRGBO(120, 14, 20, .4),
    400: const Color.fromRGBO(120, 14, 20, .5),
    500: const Color.fromRGBO(120, 14, 20, .6),
    600: const Color.fromRGBO(120, 14, 20, .7),
    700: const Color.fromRGBO(120, 14, 20, .8),
    800: const Color.fromRGBO(120, 14, 20, .9),
    900: const Color.fromRGBO(120, 14, 20, 1),
  };

  static final MaterialColor darkRed = MaterialColor(0xFF780E14, darkRedColor);

  static const Color firebaseNavy = Color(0xFF2C384A);

  static const Color darkRed2 = Color.fromARGB(255, 120, 20, 20);
  static const Color plantAccentGreen = Color.fromARGB(255, 164, 216, 156);
  static const Color darkGrey = Color.fromARGB(255, 55, 55, 55);
}
