import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../database/fuelsqflite.dart';
import '../../database/repaircarsqflite.dart';
import '../../database/transsqflite.dart';
import '../../model/repaircarmodel.dart';
import '../../provider/datetimeprovider.dart';

class AlertDialogDeleteItems extends StatelessWidget {
  const AlertDialogDeleteItems({
    Key? key,
    required this.dbname,
    // required this.dbcarpartManager,
    // required this.dateFrom,
    // required this.dateTo,
  }) : super(key: key);

  // final RepairCar st;
  // final DateTime dateFrom;
  // final DateTime dateTo;

  final String dbname;

  @override
  Widget build(BuildContext context) {
    final _datetimeProvider = Provider.of<DateTimeProvider>(context);
    final DBRepairCarManager dbcarpartManager = DBRepairCarManager();
    final DBFuelsManager dbfuelManager = DBFuelsManager();
    final DBTransManager dbtransManager = DBTransManager();
    final DateTime dateFrom = _datetimeProvider.getdateTimeFrom;
    final DateTime dateTo = _datetimeProvider.getdateTimeTo;

    return AlertDialog(
      title: const Text("Confirm"),
      content: Text(
          'Are you sure you wish to delete all items from ${dateFrom
              .year}/${dateFrom.month}/${dateFrom.day} ${dateFrom
              .hour}:${dateFrom.minute} to ${dateTo.year}/${dateTo
              .month}/${dateTo.day} ${dateTo.hour}:${dateTo.minute}'),
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
              if (dbname == 'repaircar') {
                await dbcarpartManager
                    .deleteRepairCarBetweenTowDate(
                    dateFrom.microsecondsSinceEpoch,
                    dateTo.microsecondsSinceEpoch)
                    .then((value) => print('value'));
              } else if (dbname == 'fuel') {
                dbfuelManager.deleteFuelsBetweenTowDate(
                    dateFrom.microsecondsSinceEpoch,
                    dateTo.microsecondsSinceEpoch);
              } else if (dbname == 'trans') {
                dbtransManager.deleteTransBetweenTowDate(
                    dateFrom.microsecondsSinceEpoch,
                    dateTo.microsecondsSinceEpoch);
              }
              _datetimeProvider.changeDateTimeTo(dateTo);

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
