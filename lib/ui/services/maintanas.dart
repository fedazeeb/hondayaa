import 'package:flutter/material.dart';
import 'package:hondaya/ui/services/carparts.dart';
import 'package:hondaya/ui/services/repaircar.dart';
import 'package:easy_localization/easy_localization.dart';
import '../widget/appbarwedgit.dart';

class Maintenance extends StatefulWidget {
  const Maintenance({Key? key}) : super(key: key);

  @override
  State<Maintenance> createState() => _MaintenanceState();
}

class _MaintenanceState extends State<Maintenance> {
  @override
  Widget build(BuildContext context) {
    double x = MediaQuery.of(context).size.height;
    double y = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: appBarWedgit(context, "carparts"),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: TabBar(
                indicatorWeight: 5,

                // padding: EdgeInsets.only(bottom: 1),

                tabs: [
                  Tab(
                    // icon: Icon(Icons.car_repair),
                    // text: "Repairing",
                    child: Text(
                      "buying".tr()..toString(),
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'monbaiti',
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Tab( child:
                    Text(
                      "repairing".tr()..toString(),
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'monbaiti',
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  CarPartsTab(),
                  RepairCarTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
