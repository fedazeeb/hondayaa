import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  backgroundColor: const Color(0xFF212121),
  accentColor: Colors.white,
  accentIconTheme: IconThemeData(color: Colors.black),
  dividerColor: Colors.black12,
);

final oLightTheme = ThemeData(
  // primarySwatch: Colors.grey,
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: Color.fromARGB(255, 243, 137, 94),
  ),
  primaryColor: Color.fromARGB(255, 243, 137, 94),
  appBarTheme: AppBarTheme(
    color: Color.fromARGB(255, 226, 102, 29),
// backgroundColor: Colors.green,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color.fromARGB(255, 53, 44, 39),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Color.fromARGB(255, 226, 102, 29),
  ),
  brightness: Brightness.light,
  backgroundColor: const Color(0xFFE5E5E5),
  accentColor: Colors.black,
  accentIconTheme: IconThemeData(color: Colors.white),
  dividerColor: Colors.white54,
);

final bLightTheme = ThemeData(
  // primarySwatch: Colors.grey,
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: Color.fromARGB(255, 21,190,236),
  ),
  primaryColor: const Color.fromARGB(255, 21,190,236),
  appBarTheme: const AppBarTheme(
    color: Color.fromARGB(255, 21,150,236),
// backgroundColor: Colors.green,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color.fromARGB(255, 53, 44, 39),
  ),
);

final gLightTheme = ThemeData(
  // primarySwatch: Colors.grey,
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: Color.fromARGB(255, 9,189,19),
  ),
  primaryColor: const Color.fromARGB(255, 9,189,19),
  appBarTheme: const AppBarTheme(
    color: Color.fromARGB(255, 9,159,19),
// backgroundColor: Colors.green,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color.fromARGB(255, 53, 44, 39),
  ),
);

final pLightTheme = ThemeData(
  // primarySwatch: Colors.grey,
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: Color.fromARGB(255, 250,83,209),
  ),
  primaryColor: const Color.fromARGB(255, 250,103,209),
  appBarTheme: const AppBarTheme(
    color: Color.fromARGB(255, 250,83,209),
// backgroundColor: Colors.green,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color.fromARGB(255, 53, 44, 39),
  ),
);