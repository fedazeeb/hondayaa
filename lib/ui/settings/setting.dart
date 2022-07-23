// import 'package:course/sitting/switchwidget.dart';
import 'package:flutter/material.dart';
import 'package:hondaya/style/maincolors.dart';
import 'package:hondaya/ui/settings/switchwidget.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:easy_localization/src/public_ext.dart';

import '../../provider/localprovider.dart';
import '../../provider/themenotifier.dart';
import '../../sitting/BNavigation.dart';
import '../../style/themee.dart';

import 'package:dropdown_button2/dropdown_button2.dart';

// import 'applanguse.dart';

class MySetting extends StatelessWidget {
  // int pagenumber;

  MySetting(/*{required this.pagenumber}*/);

  String dropdownValue = 'Orange';

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<LocaleProvider>(context);
    final provider = Provider.of<ThemeProvider>(context, listen: false);
    // final providerMainColors = Provider.of<MainColors>(context,listen: false);

    final themeNotifier = Provider.of<ThemeNotifier>(context, listen: false);

    FontWeight arabic;
    FontWeight english;
    if (Localizations.localeOf(context).toString() == 'ar_SA') {
      // print('arabic');
      arabic = FontWeight.w900;
      english = FontWeight.normal;
    } else {
      // print('english');
      arabic = FontWeight.normal;
      english = FontWeight.w900;
    }

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
            Text(
            "setting".tr().toString(),
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "homepagesub".tr().toString(),
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
        toolbarHeight: height * 0.15,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(70),
            bottomLeft: Radius.circular(70),
          ),
        ),
        actions: [],
      ),
      bottomNavigationBar: BNavigation(selectedIndex: 2),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ////////////////   Language    //////////////////////////////////
          ListTile(
            title: Text("language".tr().toString()),
            leading: const Icon(Icons.language),
            trailing: PopupMenuButton(
              icon: const Icon(
                Icons.expand_more,
              ),
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    child: Center(
                      child: Text(
                        'العربية',
                        style: TextStyle(
                          fontWeight: arabic,
                        ),
                      ),
                    ),
                    value: 1,
                  ),
                  PopupMenuItem(
                    child: Center(
                      child: Text(
                        'English',
                        style: TextStyle(
                          fontWeight: english,
                        ),
                      ),
                    ),
                    value: 2,
                  ),
                ];
              },
              onSelected: (value) {
                if (value == 1) {
                  context.setLocale(Locale('ar', 'SA'));
                } else {
                  context.setLocale(Locale('en', 'US'));
                }
                // Navigator.of(context).pushReplacementNamed("splashscreen");

                // print(Localizations.localeOf(context).toString());
                // context.setLocale(Locale('ar', 'SA'));
              },
              offset: Offset(0, 50),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
            ),
          ),
          ////////////////   Dark Mode   //////////////////////////////////
          ListTile(
            title: Text("darkmode".tr().toString()),
            leading: Icon(Icons.nightlight_round),
            trailing: SwitchWidget(),
            selected: false,
          ),
          ////////////////    Theme    ///////////////////////////////////
          ListTile(
            title: Text("theme".tr().toString()),
            leading: Icon(Icons.format_paint_outlined),
            trailing: DropdownButton2(
              value: provider.getThemeColor,
              items: <String>['Orange', 'Blue', 'Green', 'Pink']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  alignment: AlignmentDirectional.center,
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                      // fontSize: 30,
                      color: (value == 'Orange'
                          ? Colors.deepOrange
                          : (value == 'Blue'
                              ? Colors.blue
                              : (value == 'Green'
                                  ? Colors.green
                                  : Colors.pink))),
                    ),
                  ),
                  onTap: () {
                    if (value == 'Orange') {
                      themeNotifier.setTheme(oLightTheme);
                    } else if (value == 'Blue') {
                      themeNotifier.setTheme(bLightTheme);
                    } else if (value == 'Green') {
                      themeNotifier.setTheme(gLightTheme);
                    } else if (value == 'Pink') {
                      themeNotifier.setTheme(pLightTheme);
                    }
                    // print(MainColors().getTopColor);
                    // providerMainColors.swapMainColor(value);
                    // provider.swapLightTheme();
                  },
                );
              }).toList(),
              // Step 5.
              onChanged: (String? newValue) {
                // setState(() {
                dropdownValue = newValue!;
                provider.swapThemeColor(newValue);
                print(dropdownValue);
                // });
              },
              itemHeight: 30,
            ),
            // DropdownButton<String>(
            //   value: provider.getThemeColor,
            //   items: <String>['Orange', 'Blue', 'Green', 'Pink']
            //       .map<DropdownMenuItem<String>>((String value) {
            //     return DropdownMenuItem<String>(
            //       alignment: AlignmentDirectional.center,
            //       value: value,
            //       child: Text(
            //         value,
            //         style: TextStyle(
            //           // fontSize: 30,
            //           color: (value == 'Orange'
            //               ? Colors.deepOrange
            //               : (value == 'Blue'
            //                   ? Colors.blue
            //                   : (value == 'Green'
            //                       ? Colors.green
            //                       : Colors.pink))),
            //         ),
            //       ),
            //       onTap: () {
            //         if (value == 'Orange') {
            //           themeNotifier.setTheme(oLightTheme);
            //         } else if (value == 'Blue') {
            //           themeNotifier.setTheme(bLightTheme);
            //         } else if (value == 'Green') {
            //           themeNotifier.setTheme(gLightTheme);
            //         } else if (value == 'Pink') {
            //           themeNotifier.setTheme(pLightTheme);
            //         }
            //         // print(MainColors().getTopColor);
            //         // providerMainColors.swapMainColor(value);
            //         // provider.swapLightTheme();
            //       },
            //     );
            //   }).toList(),
            //   // Step 5.
            //   onChanged: (String? newValue) {
            //     // setState(() {
            //     dropdownValue = newValue!;
            //     provider.swapThemeColor(newValue);
            //     print(dropdownValue);
            //     // });
            //   },
            // ),
            selected: false,
          ),
          const ListTile(
            title: Text("feda.wolf1992@gmail.com"),
            subtitle: Text('00963934627852'),
            leading: Icon(Icons.email),
            // onTap: () {
            //   Navigator.pop(context);
            //   Scaffold.of(context).showSnackBar(SnackBar(
            //     content: Text("Share clicked"),
            //   ));
            // },
            // selected: false,
          ),
          ListTile(
            title: Text("aboutus".tr().toString()),
            leading: Icon(Icons.info),
            onTap: () {
              Navigator.of(context).pushNamed('about');
            },
          ),
        ],
      ),
    );
  }
}
