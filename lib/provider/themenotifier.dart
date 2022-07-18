import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../style/themee.dart';

class ThemeNotifier with ChangeNotifier {
  ThemeData _themeData;

  ThemeNotifier(this._themeData);

  getTheme() => _themeData;

  setTheme(ThemeData themeData) async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    if (themeData == oLightTheme) {
      _prefs.setString('Theme', 'Orange');
    } else if (themeData == bLightTheme) {
      _prefs.setString('Theme', 'Blue');
    } else if (themeData == gLightTheme) {
      _prefs.setString('Theme', 'Green');
    } else if (themeData == pLightTheme) {
      _prefs.setString('Theme', 'Pink');
    } else if (themeData == pLightTheme) {
      _prefs.setString('Theme', 'Dark');
    }
    _themeData = themeData;
    notifyListeners();
  }

  initialize() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    if (_prefs.containsKey('Theme')) {
      String? themeMode = _prefs.getString('Theme');
      if (themeMode == 'Orange') {
        setTheme(oLightTheme);
      } else if (themeMode == 'Blue') {
        setTheme(bLightTheme);
      } else if (themeMode == 'Green') {
        setTheme(gLightTheme);
      } else if (themeMode == 'Pink') {
        setTheme(pLightTheme);
      } else if (themeMode == 'Dark') {
        setTheme(darkTheme);
      }
    } else {
      // _prefs.setString('Theme', 'Orange');
      setTheme(oLightTheme);
    }
    print('---------- initialize -----------');

    notifyListeners();
  }
}
