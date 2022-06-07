import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:hondaya/ui/widget/homecard.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

    return Scaffold(
      appBar: AppBar(
        title: Text("homepage".tr().toString() +
            " " +
            String.fromCharCode(0x1F1EB) /*"Home Page"*/),
        actions: [
          CircleAvatar(
            child: PopupMenuButton(
              icon: Icon(
                Icons.language,
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
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
            Home_Card(
              pageName: 'transportation',
              imageName: 'images/hafei.jpg',
            ),
            Home_Card(
              pageName: 'fuel',
              imageName: 'images/gaspump.png',
            ),
            Home_Card(
              pageName: 'maintenance',
              imageName: 'images/carparts.jpg',
            ),
            Home_Card(
              pageName: 'dashboardtitle',
              imageName: 'images/report.png',
            ),
            Home_Card(
              pageName: 'alerts',
              imageName: 'images/alert.jpg',
            ),
          ],
        ),
      ),
    );
  }
}
