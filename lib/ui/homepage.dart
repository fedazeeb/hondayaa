import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hondaya/ui/widget/homecard.dart';

import '../sitting/BNavigation.dart';

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

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 7),
              child: Text(
                "homepage".tr().toString(),
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Sitka Banner',
                ),
              ),
            ),
            Text(
              "homepagesub".tr().toString(),
              style: const TextStyle(
              fontSize: 20,
              fontFamily: 'Sitka Banner',
            ),
            ),
          ],
        ),
        toolbarHeight: height * 0.15,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(70),
            bottomLeft: Radius.circular(70),
          ),
        ),
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: 7, bottom: 7),
            icon: const Icon(
              Icons.notifications,
            ),
            // iconSize: 50,
            onPressed: () {
              Navigator.of(context).pushNamed('alerts');
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Home_Card(
              pageName: 'transportation',
              imageName: 'images/hafei.png',
            ),
            Home_Card(
              pageName: 'fuel',
              imageName: 'images/gaspump.png',
            ),
            Home_Card(
              pageName: 'maintenance',
              imageName: 'images/carparts.png',
            ),
            // Home_Card(
            //   pageName: 'dashboardtitle',
            //   imageName: 'images/report.png',
            // ),
            // Home_Card(
            //   pageName: 'alerts',
            //   imageName: 'images/alert.jpg',
            // ),
          ],
        ),
      ),
      bottomNavigationBar: BNavigation(selectedIndex: 1),
    );
  }
}
