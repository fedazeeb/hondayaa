import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../database/transsqflite.dart';
import '../../model/transportationmodel.dart';
import '../../provider/datetimeprovider.dart';
import '../../sitting/pickdate.dart';
import 'package:easy_localization/easy_localization.dart';

import '../widget/alertdialogdeleteitems.dart';

class TransReport extends StatefulWidget {
  const TransReport({Key? key}) : super(key: key);

  @override
  State<TransReport> createState() => _TransReportState();
}

class _TransReportState extends State<TransReport> {
  final DBTransManager dbtransManager = DBTransManager();
  List<Trans>? trans;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    final _datetimeProvider = Provider.of<DateTimeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Transportation Report"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialogDeleteItems(
                  dbname: 'trans',
                  // dbcarpartManager: dbcarpartManager,
                  // dateFrom: _datetimeProvider.getdateTimeFrom,
                  // dateTo: _datetimeProvider.getdateTimeTo,
                );
              });
        },
        child: Icon(Icons.delete_outline),
      ),

      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "from".tr()..toString(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InkWell(
                  onTap: () async {
                    final date = await pickDate(context);
                    final time = await pickTime(context);
                    if (date == null || time == null) {
                      return;
                    } else {
                      _datetimeProvider.changeDateTimeFrom(DateTime(
                        date.year,
                        date.month,
                        date.day,
                        time.hour,
                        time.minute,
                      ));
                    }
                  },
                  child: Container(
                    width: width * 0.5,
                    height: height * 0.06,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24.0),
                        boxShadow: [BoxShadow(blurRadius: 6.0)]),
                    child: Center(
                      child: Text(
                        // '${_datetimeProvider.getdateTime}',
                        '${_datetimeProvider.getdateTimeFrom.year}/${_datetimeProvider.getdateTimeFrom.month}/${_datetimeProvider.getdateTimeFrom.day}  ${_datetimeProvider.getdateTimeFrom.hour}:${_datetimeProvider.getdateTimeFrom.minute}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "to".tr()..toString(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InkWell(
                  onTap: () async {
                    final date = await pickDate(context);
                    final time = await pickTime(context);
                    // showDatePicker(
                    //           context: context,
                    //           initialDate: DateTime.now(),
                    //           firstDate: DateTime(2010),
                    //           lastDate: DateTime(2030),
                    //         );
                    if (date == null || time == null) {
                      return;
                    } else {
                      _datetimeProvider.changeDateTimeTo(DateTime(
                        date.year,
                        date.month,
                        date.day,
                        time.hour,
                        time.minute,
                      ));
                    }
                  },
                  child: Container(
                    width: width * 0.5,
                    height: height * 0.06,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24.0),
                        boxShadow: [BoxShadow(blurRadius: 6.0)]),
                    child: Center(
                      child: Text(
                        // '${_datetimeProvider.getdateTime}',
                        '${_datetimeProvider.getdateTimeTo.year}/${_datetimeProvider.getdateTimeTo.month}/${_datetimeProvider.getdateTimeTo.day}  ${_datetimeProvider.getdateTimeTo.hour}:${_datetimeProvider.getdateTimeTo.minute}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(7),
            child: Text(
              'Drag life or right to Delete or Update item',
              style: TextStyle(fontSize: 15, color: Colors.red),
            ),
          ),

          Expanded(
            flex: 6,
            child: FutureBuilder(
              future: dbtransManager.getTransList(
                  _datetimeProvider.getdateTimeFrom.microsecondsSinceEpoch,
                  _datetimeProvider.getdateTimeTo.microsecondsSinceEpoch),
              //dbStudentManager.getStudentList(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    //studlist = snapshot.data as List<transs>?;
                    trans = snapshot.data as List<Trans>;
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: trans == null ? 0 : trans!.length,
                      //studlist == null ? 0 : studlist!.length,
                      itemBuilder: (BuildContext context, int index) {
                        //transs st = studlist![index];
                        Trans st = trans![index];
                        return Dismissible(
                          key: ValueKey(trans![index]),
                          background: Container(
                            // color: Colors.amber,
                            padding: EdgeInsets.symmetric(horizontal: 25),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24.0),
                              color: Colors.black,
                            ),
                            alignment: AlignmentDirectional.centerStart,
                            child: Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          secondaryBackground: Container(
                            // color: Colors.amber,
                            padding: EdgeInsets.symmetric(horizontal: 25),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24.0),
                              color: Colors.red,
                            ),
                            alignment: AlignmentDirectional.centerEnd,
                            child: Icon(
                              Icons.delete_outline,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          onDismissed: (direction) {
                            if (direction == DismissDirection.endToStart) {
                              // print(direction);
                              // Navigator.pushNamed(context, URepairCar.routeName,
                              //     arguments: ['feda', 'zeeb']);
                            }
                          },
                          confirmDismiss: (DismissDirection direction) async {
                            if (direction == DismissDirection.endToStart) {
                              return await showDialog(
                                context: context,
                                builder: (BuildContext context) {
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
                                            await dbtransManager
                                                .deleteTrans(st.id!)
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
                                },
                              );
                            }
                            else{
                              // print(direction);
                              // print(st);
                              // Navigator.pushNamed(context, URepairCar.routeName,
                              //     arguments: st);
                            }
                          },
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Container(
                                width: width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('ID: ${st.id}'),
                                    Text("from: ${st.ffrom}"),
                                    Text('to: ${st.tto}'),
                                    Text('distance: ${st.distance}'),
                                    Text('rent: ${st.rent}'),
                                    Text(
                                        '${DateTime.fromMicrosecondsSinceEpoch(st.datetime!)}'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return Text(
                      'No Data',
                      style: TextStyle(fontSize: 40),
                    );
                  }
                }
                return CircularProgressIndicator();
              },
            ),
          ),

          // Expanded(
          //   flex: 6,
          //   child: FutureBuilder(
          //     future: dbtransManager.getTransList(),
          //     //dbStudentManager.getStudentList(),
          //     builder: (context, snapshot) {
          //       if (snapshot.connectionState == ConnectionState.done) {
          //         if (snapshot.hasData) {
          //           //studlist = snapshot.data as List<transs>?;
          //           trans = snapshot.data as List<Trans>;
          //           return ListView.builder(
          //             shrinkWrap: true,
          //             itemCount: trans == null ? 0 : trans!.length,
          //             //studlist == null ? 0 : studlist!.length,
          //             itemBuilder: (BuildContext context, int index) {
          //               //transs st = studlist![index];
          //               Trans st = trans![index];
          //               return Card(
          //                 child: Padding(
          //                   padding: EdgeInsets.all(20),
          //                   child: Column(
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     children: <Widget>[
          //                       Text('ID: ${st.id}'),
          //                       Text("from: ${st.ffrom}"),
          //                       Text('to: ${st.tto}'),
          //                       Text('distance: ${st.distance}'),
          //                       Text('rent: ${st.rent}'),
          //                       Text(
          //                           '${DateTime.fromMicrosecondsSinceEpoch(st.datetime!)}'),
          //                     ],
          //                   ),
          //                 ),
          //               );
          //             },
          //           );
          //         } else {
          //           return Text(
          //             'No Data',
          //             style: TextStyle(fontSize: 40),
          //           );
          //         }
          //       }
          //       return CircularProgressIndicator();
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
