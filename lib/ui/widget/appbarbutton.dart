

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

AppBar buildAppBar(double x, BuildContext context) {
  return AppBar(
    backgroundColor: Colors.transparent,
    title: Text("transportation".tr().toString(),
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        )),
    elevation: 0.0,
    leading: Padding(
      padding: EdgeInsets.only(left: x * 0.01, top: 10),
      child: Ink(
        decoration: ShapeDecoration(
          color: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
        ),
        child: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          iconSize: 30,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    ),
    // title: Text(provider.getdateTime.day.toString()),
  );
}

