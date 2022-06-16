import 'package:flutter/material.dart';

class ReuseableTheme {
  static ThemeData darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      backgroundColor: Colors.black,
      primaryColor: Colors.white,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color.fromARGB(255, 1, 24, 42)),
      appBarTheme: const AppBarTheme(color: Color.fromARGB(255, 1, 24, 42)),
    );
  }

  static ThemeData lightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      backgroundColor: Colors.white,
      primaryColor: Colors.white,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color.fromARGB(255, 252, 254, 255)),
      appBarTheme: const AppBarTheme(
        color: Color.fromARGB(255, 1, 24, 42),
      ),
    );
  }
}

var darktheme = ReuseableTheme.darkTheme();
var lighttheme = ReuseableTheme.lightTheme();
