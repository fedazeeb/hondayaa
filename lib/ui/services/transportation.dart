import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hondaya/provider/datetimeprovider.dart';
import 'package:hondaya/style/style.dart';
import 'package:provider/provider.dart';

import '../../database/transsqflite.dart';
import '../../model/transportationmodel.dart';
import '../widget/appbarwedgit.dart';

class Transportation extends StatefulWidget {
  @override
  State<Transportation> createState() => _TransportationState();
}

class _TransportationState extends State<Transportation> {
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();

  Trans trans = Trans();
  final DBTransManager dbtransManager = DBTransManager();

  singUPfunction() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();
      dbtransManager.insertTrans(trans).then((value) => print(value));
      // Navigator.of(context).pushReplacementNamed("validations");
    }
  }

  DateTime dateTime = DateTime.now();

  Future<DateTime?> pickDate() => showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2010),
        lastDate: DateTime(2030),
      );

  Future<TimeOfDay?> pickTime() => showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

  @override
  Widget build(BuildContext context) {
    double y = MediaQuery.of(context).size.height;
    double x = MediaQuery.of(context).size.width;

    // final provider = Provider.of<DateTimeProvider>(context);

    return Scaffold(
      appBar: appBarWedgit(context, "transportation"),
      // buildAppBar(x, context),
      body: Column(children: [
        //////////////      left and right dirction  language ////////////////////////////////////////////////////////
        // Container(
        //   padding: EdgeInsets.all(x * 0.02),
        //   height: y * 0.25,
        //   child: Align(
        //     alignment: Localizations.localeOf(context).toString() == 'ar_SA'
        //         ? Alignment.bottomRight
        //         : Alignment.bottomLeft,
        //     child: Text("transportation".tr().toString(),
        //         style: TextStyle(
        //           fontSize: 25,
        //           fontWeight: FontWeight.bold,
        //         )),
        //   ),
        // ),
        ////////////////////////////////////////////////////////////////////////////////////////////
        Container(
          width: MediaQuery.of(context).size.height * 0.38,
          height: MediaQuery.of(context).size.height * 0.177,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/hafei.png'),
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(10),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(y * 0.02),
                    child: Form(
                      key: formstate,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // From TFF
                          Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 10),
                            child: Text(
                              "from".tr()..toString(),
                              style: const TextStyle(
                                fontSize: 25,
                                fontFamily: 'monbaiti',
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              // borderRadius: BorderRadius.circular(24.0),
                              boxShadow: [BoxShadow(blurRadius: 2.0)],
                            ),
                            child: TextFormField(
                              validator: (val) {
                                if (val!.length > 10) {
                                  return "valid1tff".tr()..toString();
                                }
                                if (val.length < 2) {
                                  return "valid2tff".tr()..toString();
                                }
                                return null;
                              },
                              onSaved: (val) {
                                trans.ffrom = val!;
                              },
                              // autofocus: true,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                // enabledBorder: InputBorder.none,
                                // hintText: "from".tr()..toString(),
                                prefixIcon: Icon(Icons.location_on_outlined),
                                border: InputBorder.none,
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 10),
                            child: Text(
                              "to".tr()..toString(),
                              style: const TextStyle(
                                fontSize: 25,
                                fontFamily: 'monbaiti',
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          // To TFF
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [BoxShadow(blurRadius: 2.0)],
                            ),
                            child: TextFormField(
                              validator: (val) {
                                if (val!.length > 10) {
                                  return "valid1tff".tr()..toString();
                                }
                                if (val.length < 2) {
                                  return "valid2tff".tr()..toString();
                                }
                                return null;
                              },
                              onSaved: (val) {
                                trans.tto = val!;
                              },
                              // autofocus: true,
                              textInputAction: TextInputAction.next,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.location_on),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 10),
                            child: Text(
                              "distance".tr()..toString(),
                              style: const TextStyle(
                                fontSize: 25,
                                fontFamily: 'monbaiti',
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          // distance TFF
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [BoxShadow(blurRadius: 2.0)]),
                            child: TextFormField(
                              validator: (val) {
                                if (val!.length > 10) {
                                  return "valid1tff".tr()..toString();
                                }
                                if (val.length < 1) {
                                  return "valid2tff".tr()..toString();
                                }
                                return null;
                              },
                              onSaved: (val) {
                                trans.distance = int.tryParse(val!);
                              },
                              // autofocus: true,
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.social_distance),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          // Date
                          Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 10),
                            child: Text(
                              "date".tr()..toString(),
                              style: const TextStyle(
                                fontSize: 25,
                                fontFamily: 'monbaiti',
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              final date = await pickDate();
                              final time = await pickTime();
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
                                trans.datetime =
                                    dateTime.microsecondsSinceEpoch;
                              }
                            },
                            child: Container(
                              // width: y * 0.5,
                              height: y * 0.05,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [BoxShadow(blurRadius: 2.0)]),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Icon(
                                      Icons.calendar_today_outlined,
                                    ),
                                  ),
                                  Text(
                                    '${dateTime.year}/${dateTime.month}/${dateTime.day}  ${dateTime.hour}:${dateTime.minute}',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      // fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 10),
                            child: Text(
                              "rent".tr()..toString(),
                              style: const TextStyle(
                                fontSize: 25,
                                fontFamily: 'monbaiti',
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          // Rent price TFF
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [BoxShadow(blurRadius: 2.0)]),
                            child: TextFormField(
                              validator: (val) {
                                if (val!.length > 10) {
                                  return "valid1tff".tr()..toString();
                                }
                                if (val.length < 1) {
                                  return "valid2tff".tr()..toString();
                                }
                                return null;
                              },
                              onSaved: (val) {
                                trans.rent = int.tryParse(val!);
                              },
                              // autofocus: true,
                              keyboardType: TextInputType.number,
                              // inputFormatters: [
                              //   CurrencyTextInputFormatter(decimalDigits: 0,
                              //   locale: 'en'),
                              // ],
                              style: TextStyle(
                                fontSize: 20,
                              ),
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.attach_money,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          // Sign up bottom
                          Container(
                            width: x,
                            height: y * 0.06,
                            decoration: BoxDecoration(
                              // color: Colors.white,
                              // gradient: LinearGradient(
                              //   colors: <Color>[
                              //     Colors.black,
                              //     Colors.red,
                              //   ],
                              // ),
                              borderRadius: BorderRadius.circular(24.0),
                              boxShadow: [
                                BoxShadow(blurRadius: 2.0),
                              ],
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                  // primary: Colors.transparent,
                                  textStyle: TextStyle(
                                    // color: Colors.transparent,
                                    fontSize: 20.0,
                                  )),
                              onPressed: () async {
                                //showLoading(context);
                                // Navigator.of(context).pushNamed("validations");
                                // trans.rent = 10;
                                trans.datetime =
                                    dateTime.microsecondsSinceEpoch;
                                // trans.distance = 10;
                                // trans.ffrom = 'damascus';
                                // trans.tto = 'homs';
                                singUPfunction();
                              },
                              child: Text(
                                "addrequest".tr()..toString(),
                                style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: 'SEGOEUI',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

showLoading(context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Please Wait"),
          content: Container(
              height: 50,
              child: CircularProgressIndicator(
                backgroundColor: Colors.black,
              )),
        );
      });
}
