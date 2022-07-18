import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/appclass.dart';
import '../../provider/localprovider.dart';
import '../../provider/themenotifier.dart';
import '../../style/themee.dart';

class SwitchWidget extends StatefulWidget {
  const SwitchWidget({Key? key}) : super(key: key);

  @override
  _SwitchWidgetState createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  bool isSwitch = false;

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<ThemeProvider>(context,listen: false);
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    if(themeNotifier.getTheme() == darkTheme){
      isSwitch = true;
    }
    else{
      isSwitch = false;
    }
    // bool _isSelectedTheme = appThemes[i].mode == themeProvider.selectedThemeMode;

    return Switch(
      onChanged: (bool value) {
        //////////////////////////////////////
        // provider.swapTheme();
        themeNotifier.setTheme(darkTheme);
        /////////////////////////////////////
        if (isSwitch == false) {
          themeNotifier.setTheme(darkTheme);
          setState(() {
            // provider.setDarkMode(
            //   ThemeData.light().copyWith(
            //       // primaryColor: Colors.green,
            //       // indicatorColor: Colors.green,
            //       // primaryColorLight: Colors.green,
            //       colorScheme: ColorScheme.light().copyWith(
            //         primary: Colors.deepOrange,
            //       ),
            //       appBarTheme: AppBarTheme(
            //         color: Colors.deepOrange,
            //         // backgroundColor: Colors.green,
            //       ),
            //       bottomNavigationBarTheme:
            //           BottomNavigationBarThemeData(
            //             backgroundColor: Colors.brown,
            //           ) // scaffoldBackgroundColor: Colors.green,
            //       ),
            // );
            isSwitch = true;
          });
        } else {
          themeNotifier.setTheme(oLightTheme);
          setState(() {
            // provider.setDarkMode(ThemeData.dark());
            isSwitch = false;
          });
        }
      },
      value: isSwitch,
    );
  }
}
