import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:hondaya/provider/datetimeprovider.dart';
import 'package:hondaya/style/style.dart';
import 'package:hondaya/ui/widget/appbarbutton.dart';
import 'package:provider/provider.dart';

import '../../database/transsqflite.dart';
import '../../model/transportationmodel.dart';

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
    double x = MediaQuery.of(context).size.height;
    double y = MediaQuery.of(context).size.width;

    // final provider = Provider.of<DateTimeProvider>(context);

    return Scaffold(
      appBar: buildAppBar(x, context),
      body: Column(children: [
        Container(
          padding: EdgeInsets.all(x * 0.02),
          height: y * 0.25,
          child: Align(
            alignment: Localizations.localeOf(context).toString() == 'ar_SA'
                ? Alignment.bottomRight
                : Alignment.bottomLeft,
            child: Text("transportation".tr().toString(),
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(10),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(x * 0.02),
                    child: Form(
                      key: formstate,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // From TFF
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(24.0),
                              boxShadow: [BoxShadow(blurRadius: 6.0)],
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
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
                                  hintText: "from".tr()..toString(),
                                  prefixIcon: Icon(Icons.location_on_outlined),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          // To TFF
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(24.0),
                              boxShadow: [BoxShadow(blurRadius: 6.0)],
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
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
                                  hintText: "to".tr()..toString(),
                                  prefixIcon: Icon(Icons.location_on),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // distance TFF
                              Container(
                                width: y * 0.4,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(24.0),
                                    boxShadow: [BoxShadow(blurRadius: 6.0)]),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 15),
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
                                      hintText: "distance".tr()..toString(),
                                      prefixIcon: Icon(Icons.social_distance),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                              // price TFF
                              Container(
                                width: y * 0.4,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(24.0),
                                    boxShadow: [BoxShadow(blurRadius: 6.0)]),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 15),
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
                                      hintText: "rent".tr()..toString(),
                                      prefixIcon: Icon(
                                        Icons.attach_money,
                                      ),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          // Pick date
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
                                trans.datetime = dateTime.microsecondsSinceEpoch;
                              }
                            },
                            child: Container(
                              width: y * 0.5,
                              height: x * 0.06,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(24.0),
                                  boxShadow: [BoxShadow(blurRadius: 6.0)]),
                              child: Center(
                                child: Text(
                                  '${dateTime.year}/${dateTime.month}/${dateTime.day}  ${dateTime.hour}:${dateTime.minute}',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const SizedBox(
                            height: 10,
                          ), // Sign up bottom
                          Container(
                            width: y,
                            height: x * 0.06,
                            decoration: BoxDecoration(
                              // color: Colors.white,
                              gradient: LinearGradient(
                                colors: <Color>[
                                  Colors.black,
                                  Colors.red,
                                ],
                              ),
                              borderRadius: BorderRadius.circular(24.0),
                              boxShadow: [
                                BoxShadow(blurRadius: 6.0),
                              ],
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                  primary: Colors.transparent,
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
                                  fontSize: 20,
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
