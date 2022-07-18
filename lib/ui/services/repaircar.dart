import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../database/repaircarsqflite.dart';
import '../../database/transsqflite.dart';
import '../../model/repaircarmodel.dart';

class RepairCarTab extends StatefulWidget {
  const RepairCarTab({Key? key}) : super(key: key);

  @override
  State<RepairCarTab> createState() => _RepairCarTabState();
}

class _RepairCarTabState extends State<RepairCarTab> {
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();

  RepairCar repaircar = RepairCar();

  // final DBRepairCarManager dbrepaircarManager = DBRepairCarManager();
  final DBTransManager dbrepaircarManager = DBTransManager();

  singUPfunction() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      // repaircar.mechanic = 'Majed';
      // repaircar.phone = 0993991503;
      formdata.save();
      dbrepaircarManager
          .insertRepairCar(repaircar)
          .then((value) => print(value));

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
          width: y * 0.7,
          height: x * 0.177,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/carparts.png'),
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
                    padding: EdgeInsets.all(x * 0.02),
                    child: Form(
                      key: formstate,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 20, bottom: 10),
                            child: Text(
                              "operation".tr()..toString(),
                              style: TextStyle(
                                fontSize: 25,
                                fontFamily: 'monbaiti',
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          // car part name TFF
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
                                repaircar.name = val;
                              },
                              // autofocus: true,
                              textInputAction: TextInputAction.next,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                              decoration: InputDecoration(
                                hintText: "operation".tr()..toString(),
                                prefixIcon: Icon(Icons.car_repair),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20, bottom: 10),
                            child: Text(
                              "Mechanic Name",
                              style: TextStyle(
                                fontSize: 25,
                                fontFamily: 'monbaiti',
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

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
                                repaircar.mechanic = val;
                              },
                              // autofocus: true,
                              textInputAction: TextInputAction.next,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.car_repair),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20, bottom: 10),
                            child: Text(
                              "Phone Numner",
                              style: TextStyle(
                                fontSize: 25,
                                fontFamily: 'monbaiti',
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

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
                                if (val.length < 10) {
                                  return "valid2tff".tr()..toString();
                                }
                                return null;
                              },
                              onSaved: (val) {
                                repaircar.phone = int.tryParse(val!);
                              },
                              // autofocus: true,
                              textInputAction: TextInputAction.next,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.car_repair),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20, bottom: 10),
                            child: Text(
                              "qty".tr()..toString(),
                              style: TextStyle(
                                fontSize: 25,
                                fontFamily: 'monbaiti',
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          // TFF Quantity
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
                                repaircar.quantity = int.tryParse(val!);
                              },
                              // autofocus: true,
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                    Icons.production_quantity_limits),
                                border: InputBorder.none,
                              ),
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.only(top: 20, bottom: 10),
                            child: Text(
                              "price".tr()..toString(),
                              style: TextStyle(
                                fontSize: 25,
                                fontFamily: 'monbaiti',
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          // TFF Price
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
                                repaircar.price = int.tryParse(val!);
                              },
                              // autofocus: true,
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.attach_money),
                                border: InputBorder.none,
                              ),
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.only(top: 20, bottom: 10),
                            child: Text(
                              "carpart".tr()..toString(),
                              style: TextStyle(
                                fontSize: 25,
                                fontFamily: 'monbaiti',
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
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
                              height: x * 0.06,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [BoxShadow(blurRadius: 2.0)]),
                              child: Row(
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
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          // Sign up bottom
                          Container(
                            width: y,
                            height: x * 0.06,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24.0),
                              boxShadow: [
                                BoxShadow(blurRadius: 4.0),
                              ],
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                  textStyle: TextStyle(
                                    fontSize: 25,
                                    fontFamily: 'SEGOEUI',
                                  )),
                              onPressed: () async {
                                //showLoading(context);
                                // Navigator.of(context).pushNamed("validations");
                                repaircar.datetime =
                                    dateTime.microsecondsSinceEpoch;
                                repaircar.type = 'r';
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
