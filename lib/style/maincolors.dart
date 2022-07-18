import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainColors extends ChangeNotifier {
  List<Color> colors = [Colors.blue, Colors.blue, Colors.blue, Colors.blue];

  Color top = Color.fromARGB(255, 243, 137, 94);
  Color menu = Color.fromARGB(255, 53, 44, 39);
  Color button = Color.fromARGB(255, 226, 102, 29);
  Color grey = Color.fromARGB(255, 183, 183, 183);
  Color lightpink = Color.fromARGB(255, 251, 234, 227);

  Color get getTopColor => top;

  Color get getmenuColor => menu;

  Color get getbuttonColor => button;

  Color get getgreyColor => grey;

  Color get getlightpinkColor => lightpink;

  initialize() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    if (_prefs.containsKey('color')) {
      String? _mainColor = _prefs.getString('color');
      swapMainColor(_mainColor!);
      //   print(isDarkMode);
      //   _selecgtedTheme = isDarkMode! ? light : dark;
    } else {
      _prefs.setString('color', 'Orange');
      top = Color.fromARGB(255, 21,150,236);
      menu = Color.fromARGB(255, 53, 44, 39);
      button = Color.fromARGB(255, 226, 102, 29);
      grey = Color.fromARGB(255, 183, 183, 183);
      lightpink = Color.fromARGB(255, 251, 234, 227);
    }
    // print('---------- initialize -----------');
    // print(_prefs.getBool('isDarkTheme'));

    notifyListeners();
  }

  Future<void> swapMainColor(String _color) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    if (_color == 'Orange') {
      _prefs.setString('color', 'Orange');
      top = Color.fromARGB(255, 243, 137, 94);
      button = Color.fromARGB(255, 226, 102, 29);
    } else if (_color == 'Blue') {
      _prefs.setString('color', 'Blue');
      top = Color.fromARGB(255, 21,150,236);
      button = Color.fromARGB(255, 21,190,236);
    } else if (_color == 'Green') {
      _prefs.setString('color', 'Green');
      top = Color.fromARGB(255, 9,159,19);
      button = Color.fromARGB(255, 9,189,19);
    } else if (_color == 'Pink') {
      _prefs.setString('color', 'Pink');
      top = Color.fromARGB(255, 250,83,209);
      button = Color.fromARGB(255, 250,103,209);
    }
    notifyListeners();
  }

  Map<String, Color> orangeColor = {
    'top': Color.fromARGB(255, 243, 137, 94),
    'menu': Color.fromARGB(255, 53, 44, 39),
    'button': Color.fromARGB(255, 226, 102, 29),
    'grey': Color.fromARGB(255, 183, 183, 183),
    'lightpink': Color.fromARGB(255, 251, 234, 227),
  };
}
