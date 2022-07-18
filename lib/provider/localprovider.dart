import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../style/maincolors.dart';

class ThemeProvider extends ChangeNotifier {
  String _selectedThemeColor = 'Orange';

  late Color top = Color.fromARGB(255, 243, 137, 94);
  Color menu = Color.fromARGB(255, 53, 44, 39);
  Color button = Color.fromARGB(255, 226, 102, 29);
  Color grey = Color.fromARGB(255, 183, 183, 183);
  Color lightpink = Color.fromARGB(255, 251, 234, 227);

  String get getThemeColor => _selectedThemeColor;

  initializeThemeColor() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    if (_prefs.containsKey('Theme')) {
      String? themeMode = _prefs.getString('Theme');
      if (themeMode == 'Orange') {
        _selectedThemeColor = 'Orange';
      } else if (themeMode == 'Blue') {
        _selectedThemeColor = 'Blue';
      } else if (themeMode == 'Green') {
        _selectedThemeColor = 'Green';
      } else if (themeMode == 'Pink') {
        _selectedThemeColor = 'Pink';
      }
    } else {
      swapThemeColor('Orange');
    }
    notifyListeners();
  }

  swapThemeColor(String themeColor) {
    _selectedThemeColor = themeColor;
    notifyListeners();
  }

  ////////////////////////////////////  Theme Mode   ////////////////////////////////////
  // Locale _locale = Locale("en");
  ThemeData _selecgtedTheme = ThemeData.dark();

  ThemeData light = ThemeData.light().copyWith(
    colorScheme: ColorScheme.light().copyWith(
      primary: MainColors().getTopColor,
    ),
    appBarTheme: AppBarTheme(
      color: MainColors().getTopColor,
      // backgroundColor: Colors.green,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.brown,
    ),
  );

  ThemeData dark = ThemeData.dark();

  /*ThemeProvider(/*{required bool isDarkMode}*/){
  /*  bool isDarkMode = true;
    _selecgtedTheme = isDarkMode ? light :dark;*/
  }*/

  initialize() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    if (_prefs.containsKey('isDarkTheme')) {
      bool? isDarkMode = _prefs.getBool('isDarkTheme');
      print(isDarkMode);
      _selecgtedTheme = isDarkMode! ? light : dark;
    } else {
      _prefs.setBool('isDarkTheme', false);
      _selecgtedTheme = light;
    }
    print('---------- initialize -----------');
    print(_prefs.getBool('isDarkTheme'));

    notifyListeners();
  }

  Future<void> swapTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print('----------  before   ---------------');
    print(prefs.getBool('isDarkTheme'));
    if (_selecgtedTheme == dark) {
      _selecgtedTheme = light;
      prefs.setBool("isDarkTheme", true);
    } else {
      _selecgtedTheme = dark;
      prefs.setBool("isDarkTheme", false);
    }
    print('----------  after  ---------------');
    print(prefs.getBool('isDarkTheme'));
    notifyListeners();
  }

  Future<void> swapLightTheme() async {
    _selecgtedTheme = light;
    notifyListeners();
  }

  ThemeData get getTheme => _selecgtedTheme;
/*
  MaterialColor _primarycolor = Colors.deepOrange;

  // = Locale("en");

  // LocaleProvider() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   print(prefs.getString('lang'));
  //   _locale = Locale(prefs.getString('lang')!);
  // }

  // Locale get locale => _locale;
  ThemeData get darkTheme => _darkTheme;

  MaterialColor get primarycolor => _primarycolor;

  // Future<Locale> getFromShared() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   //   print(prefs.getString('lang'));
  //   //   _locale = Locale(prefs.getString('lang')!);
  //   return  Locale(prefs.getString('lang')!);
  // }

  fetchProvider() async {
    var prefs = await SharedPreferences.getInstance();
    print("++++++++++++++++++++++++++++++");
    print(prefs.getString('lang'));
    if (prefs.getString('darkTheme') == null) {
      _darkTheme = ThemeData.light();
      prefs.setString("darkTheme", "light");
      return Null;
    }
    String theme;
    print("+++++++----------------+++++++++");
    print(prefs.getString('lang'));
    if ("light" == Locale(prefs.getString('darkTheme')!)) {
      _darkTheme = ThemeData.light();
      notifyListeners();
    } else {
      print("+++++++++/////////////////////+++++++++");
      print(prefs.getString('lang'));
      _darkTheme = ThemeData.dark();
      notifyListeners();
    }
    return Null;
  }

  // void setLocale(Locale locale) {
  //   //  if (!L10n.all.contains(locale)) return;
  //
  //   _locale = locale;
  //   notifyListeners();
  // }

  void setDarkMode(ThemeData themeData) async {
    var prefs = await SharedPreferences.getInstance();
    if (themeData == ThemeData.dark()) {
      prefs.setString("darkTheme", "dark");
    } else {
      prefs.setString("darkTheme", "light");
    }
    _darkTheme = themeData;
    notifyListeners();
  }
*/
// void clearLocale() {
//   _locale = const Locale("en");
//   notifyListeners();
// }

// void changeLanguages() async {
//   //(prefs.getString('lang') ?? "en");
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   print(prefs.getString('lang'));
//   _locale = Locale(prefs.getString('lang')!);
//   // notifyListeners();
// }
}
