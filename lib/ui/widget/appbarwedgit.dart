import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

AppBar appBarWedgit(BuildContext context , String pagename) {
  double height = MediaQuery.of(context).size.height;
  return AppBar(
    leading: Padding(
      padding: const EdgeInsets.only(
        bottom: 35,
        right: 15,
        left: 15,
        top: 15,
      ),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 15,
        child: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 15,
          ),
          color: Theme.of(context).primaryColor,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    ),
    centerTitle: true,
    title: Column(
      children: [
        Text(
          pagename.tr().toString(),
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
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
    actions: [],
  );
}
