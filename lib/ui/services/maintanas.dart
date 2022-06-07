import 'package:flutter/material.dart';
import 'package:hondaya/ui/services/carparts.dart';
import 'package:hondaya/ui/services/repaircar.dart';

import '../widget/appbarbutton.dart';

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
        appBar: AppBar(
          title: Text('Maintenance'),
          bottom: TabBar(

            indicatorColor: Colors.black54,
            indicatorWeight: 5,
            padding: EdgeInsets.only(bottom: 1),
            // indicatorSize: TabBarIndicatorSize.label,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.green,
            ),
            tabs: [
              Tab(
                icon: Icon(Icons.car_repair),
              ),
              Tab(
                icon: Icon(Icons.construction),
              ),
            ],

          ),
        ),

        body: TabBarView(
          children: [
            CarPartsTab(),
            RepairCarTab(),
          ],
        ),
      ),
    );
  }
}
