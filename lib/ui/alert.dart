import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hondaya/ui/widget/appbarwedgit.dart';
import 'package:provider/provider.dart';

import '../api/notification_api.dart';
import '../database/transsqflite.dart';
import '../model/alerts.dart';
import '../provider/datetimeprovider.dart';
import '../sitting/pickdate.dart';
import 'package:easy_localization/easy_localization.dart';

class Alerat_Page extends StatefulWidget {
  const Alerat_Page({Key? key}) : super(key: key);

  @override
  State<Alerat_Page> createState() => _Alerat_PageState();
}

class _Alerat_PageState extends State<Alerat_Page> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    NotificationWidget.init();
    listenNotifications();
  }

  void listenNotifications() =>
      NotificationWidget.onNotifications.stream.listen((event) {});

  void onClickedNotification(String? payload) =>
      Navigator.of(context).pushReplacementNamed("alerts");

  GlobalKey<FormState> formstate = new GlobalKey<FormState>();

  DateTime dateTime = DateTime.now();

  final DBTransManager dbtransManager = DBTransManager();

  Alerts alerts = Alerts();

  List<Alerts>? alert;

  addAlertfunction() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();
      print(alerts.title);
      print(alerts.description);
      print(alerts.datetime);
      print(alerts.pushid);
      alerts.pushid = await dbtransManager.insertAlerts(alerts);
      // Navigator.of(context).pushReplacementNamed("validations");

      ////////////////////////////////////////////////////////////////////
      print('*********************************');
      print(alerts.pushid);
      // int x = (alerts.pushid! / ((pow(10, (log(alerts.pushid!)) as int))).toInt();
      // print((alerts.pushid! / ((pow(10, (log(alerts.pushid!)) as int)) as int))
      //     as int);
      NotificationWidget.showScheduledNotifications(
        id: alerts.pushid,
        title: alerts.title,
        body: alerts.description,
        payload: 'dinner_6pm',
        scheduledDate: dateTime
            // DateTime(2022, 5, 18, 14, 44, 0, 0, 0)
            // .now()
            .add(
          Duration(
            seconds: 2,
          ),
        ),
      );
      const snackBar = SnackBar(
        content: Text(
          'showScheduledNotifications',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.green,
      );
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    double y = MediaQuery.of(context).size.height;
    double x = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: appBarWedgit(context, "alerts"),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          alerts = new Alerts();
          dateTime = DateTime.now();
          await alertShowDialog(context, y, x, false);
        },
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: FutureBuilder(
        future: dbtransManager.getAlertsList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              alert = snapshot.data as List<Alerts>;
              return ListView.builder(
                shrinkWrap: true,
                itemCount: alert == null ? 0 : alert!.length,
                itemBuilder: (BuildContext context, int index) {
                  //transs st = studlist![index];
                  Alerts st = alert![index];
                  return Card(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Container(
                        width: y,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            // Text('ID: ${st.id}'),
                            // Text("pushid: ${st.pushid}"),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    '${"title".tr()..toString()}: ${st.title}',
                                    style: const TextStyle(
                                      fontSize: 25,
                                      fontFamily: 'monbaiti',
                                      // fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  // flex: 1,
                                ),
                                IconButton(
                                  onPressed: () async {
                                    alerts = st;
                                    int? i = st.datetime;
                                    dateTime =
                                        DateTime.fromMicrosecondsSinceEpoch(i!);
                                    await alertShowDialog(context, y, x, true);
                                    // alerts = new Alerts();
                                  },
                                  icon: Icon(Icons.edit),
                                  color: Colors.green,
                                ),
                                IconButton(
                                  onPressed: () async {
                                    await NotificationWidget.cancelNotification(
                                        st.pushid);
                                    await dbtransManager.deleteAlerts(st.id);
                                    setState(() {});
                                  },
                                  icon: Icon(Icons.delete),
                                  color: Colors.red,
                                ),
                              ],
                            ),
                            Text(
                              '${"description".tr()..toString()}: ${st.description}',
                              style: const TextStyle(
                                fontSize: 25,
                                fontFamily: 'monbaiti',
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${"date".tr()..toString()}: ${DateTime.fromMicrosecondsSinceEpoch(st.datetime!)}',
                              style: const TextStyle(
                                fontSize: 25,
                                fontFamily: 'monbaiti',
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: Text(
                  'No Data',
                  style: TextStyle(
                    fontSize: 40,
                    fontFamily: 'monbaiti',
                  ),
                ),
              );
            }
          }
          return CircularProgressIndicator();
        },
      ),
      // Container(
      //   child: Center(
      //     child: Column(
      //       children: [
      //         SizedBox(
      //           height: 30,
      //         ),
      //         ElevatedButton(
      //           child: Text('Simple Notiviaction'),
      //           onPressed: () => NotificationWidget.showNotifications(
      //             title: "Notification",
      //             body: "this is testing notification",
      //             id: 0,
      //           ),
      //         ),
      //         SizedBox(
      //           height: 30,
      //         ),
      //         ElevatedButton(
      //           child: Text('Simple 2 Notiviaction'),
      //           onPressed: () => NotificationWidget.showNotifications(
      //             title: "Notification 2222 ",
      //             body: "this is testing notification 22222",
      //             id: 1,
      //           ),
      //         ),
      //         SizedBox(
      //           height: 30,
      //         ),
      //         ElevatedButton(
      //             child: Text('Scheduled Notiviaction'),
      //             onPressed: () {
      //               NotificationWidget.showScheduledNotifications(
      //                 title: "Notification",
      //                 body: "this is testing notification",
      //                 payload: 'dinner_6pm',
      //                 scheduledDate: DateTime(2022, 5, 18, 14, 44, 0, 0, 0)
      //                     // .now()
      //                     .add(
      //                   Duration(
      //                     seconds: 2,
      //                   ),
      //                 ),
      //               );
      //               const snackBar = SnackBar(
      //                 content: Text(
      //                   'showScheduledNotifications',
      //                   style: TextStyle(
      //                     fontSize: 24,
      //                   ),
      //                 ),
      //                 backgroundColor: Colors.green,
      //               );
      //               ScaffoldMessenger.of(context)
      //                 ..removeCurrentSnackBar()
      //                 ..showSnackBar(snackBar);
      //             }),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }

  alertShowDialog(BuildContext context, double y, double x, bool update) async {
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: Text(
            "addnotification".tr()..toString(),
            style: const TextStyle(
              fontSize: 25,
              // fontWeight: FontWeight.bold,
              fontFamily: 'Sitka Banner',
            ),
          ),
          content: Form(
            key: formstate,
            child: Container(
              height: y / 4,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Title TFF
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      // borderRadius: BorderRadius.circular(24.0),
                      boxShadow: [BoxShadow(blurRadius: 2.0)],
                    ),
                    child: TextFormField(
                      initialValue: alerts.title,
                      validator: (val) {
                        if (val!.length > 20) {
                          return "valid1tff".tr()..toString();
                        }
                        if (val.length < 2) {
                          return "valid2tff".tr()..toString();
                        }
                        return null;
                      },
                      onSaved: (val) {
                        alerts.title = val!;
                      },
                      // autofocus: true,
                      style: const TextStyle(
                        fontSize: 20,
                        fontFamily: 'monbaiti',
                      ),
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        // enabledBorder: InputBorder.none,
                        hintText: "title".tr()..toString(),
                        prefixIcon: Icon(Icons.title),
                        // border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Description TFF
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [BoxShadow(blurRadius: 2.0)],
                      ),
                      child: TextFormField(
                        initialValue: alerts.description,
                        validator: (val) {
                          if (val!.length > 200) {
                            return "valid1tff".tr()..toString();
                          }
                          if (val.length < 2) {
                            return "valid2tff".tr()..toString();
                          }
                          return null;
                        },
                        onSaved: (val) {
                          alerts.description = val!;
                        },
                        // autofocus: true,
                        style: const TextStyle(
                          fontSize: 20,
                          fontFamily: 'monbaiti',
                        ),
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          // enabledBorder: InputBorder.none,
                          hintText: "description".tr()..toString(),
                          prefixIcon: Icon(Icons.description),
                          // border: InputBorder.none,
                        ),
                        maxLines: 3,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Pick date
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
                        setState(() {
                          dateTime = DateTime(
                            date.year,
                            date.month,
                            date.day,
                            time.hour,
                            time.minute,
                          );
                        });
                        print(dateTime);
                        alerts.datetime = dateTime.microsecondsSinceEpoch;
                        alerts.pushid =
                            (dateTime.microsecondsSinceEpoch / 1000).round();
                      }
                    },
                    child: Container(
                      width: y * 0.6,
                      height: x * 0.11,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [BoxShadow(blurRadius: 2.0)]),
                      child: Center(
                        child: Text(
                          '${dateTime.year}/${dateTime.month}/${dateTime.day}  ${dateTime.hour}:${dateTime.minute}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontFamily: 'monbaiti',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text("cancel".tr()..toString()),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(24.0),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                if (update) {
                  await NotificationWidget.cancelNotification(alerts.pushid);
                  await dbtransManager.deleteAlerts(alerts.id);
                }
                await addAlertfunction();

                Navigator.of(context).pop(true);
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(24.0),
                ),
              ),
              child: update ? Text("update".tr()..toString()) : Text("add".tr()..toString()),
            ),
          ],
        ),
      ),
    );
  }
}
