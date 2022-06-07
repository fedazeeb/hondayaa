import 'package:flutter/material.dart';
import 'package:hondaya/ui/widget/appbarbutton.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../database/repaircarsqflite.dart';
import '../../model/repaircarmodel.dart';

class CarPartsTab extends StatefulWidget {
  const CarPartsTab({Key? key}) : super(key: key);

  @override
  State<CarPartsTab> createState() => _CarPartsTabState();
}

class _CarPartsTabState extends State<CarPartsTab> {
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();

  RepairCar repaircar = RepairCar();
  final DBRepairCarManager dbrepaircarManager = DBRepairCarManager();

  singUPfunction() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      repaircar.mechanic = 'Majed';
      repaircar.phone = 0993991503;
      formdata.save();
      dbrepaircarManager.insertRepairCar(repaircar).then((value) => print(value));

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
    return Scaffold(
      body: Column(children: [
        Container(
          padding: EdgeInsets.all(x * 0.02),
          height: y * 0.25,
          child: Align(
            alignment: Localizations.localeOf(context).toString() == 'ar_SA'
                ? Alignment.bottomRight
                : Alignment.bottomLeft,
            child: Text("carpartsrequest".tr().toString(),
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
                          // car part name TFF
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
                                  repaircar.name = val;
                                },
                                // autofocus: true,
                                textInputAction: TextInputAction.next,
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                                decoration: InputDecoration(
                                  hintText: "carpart".tr()..toString(),
                                  prefixIcon: Icon(Icons.car_repair),
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
                                      repaircar.quantity = int.tryParse(val!);
                                    },
                                    // autofocus: true,
                                    keyboardType: TextInputType.number,
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                      hintText: "qty".tr()..toString(),
                                      prefixIcon: Icon(Icons.production_quantity_limits),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
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
                                      repaircar.price = int.tryParse(val!);
                                    },
                                    // autofocus: true,
                                    keyboardType: TextInputType.number,
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                      hintText: "price".tr()..toString(),
                                      prefixIcon: Icon(Icons.attach_money),
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
                                repaircar.datetime = dateTime.microsecondsSinceEpoch;
                                repaircar.type = 'p';
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
