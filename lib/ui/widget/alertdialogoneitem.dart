import 'package:flutter/material.dart';

import '../../database/fuelsqflite.dart';
import '../../database/repaircarsqflite.dart';
import '../../database/transsqflite.dart';
import '../../model/repaircarmodel.dart';

class AlertDialogOneItem extends StatelessWidget {
  const AlertDialogOneItem({
    Key? key,
    required this.dbcarpartManager,
    required this.st,
    // required this.dbfuelManager,
    // this.dbfuelManager,
  }) : super(key: key);
  final DBTransManager dbcarpartManager;
  // final DBRepairCarManager dbcarpartManager;
  final RepairCar st;
  // final DBFuelsManager dbfuelManager;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Confirm"),
      content: const Text("Are you sure you wish to delete this item?"),
      actions: <Widget>[
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.transparent,
              textStyle: TextStyle(
                  // color: Colors.transparent,
                  // fontSize: 20.0,
                  ),
            ),
            onPressed: () async {
              await dbcarpartManager
                  .deleteRepairCar(st.id!)
                  .then((value) => print('value'));
              Navigator.of(context).pop(true);
            },
            child: const Text("DELETE")),
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text("CANCEL"),
        ),
      ],
    );
  }
}
