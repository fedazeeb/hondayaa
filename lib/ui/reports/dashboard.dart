import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          dashBg,
          Container(
            child: Column(
              children: <Widget>[
                ListTile(
                    contentPadding:
                        EdgeInsets.only(left: 20, right: 20, top: 20),
                    title: Text(
                      "dashboardtitle".tr().toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      '10 items',
                      style: TextStyle(color: Colors.blue),
                    ),
                    leading: Ink(
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                        ),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                        iconSize: 30,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    )
                    // CircleAvatar(),
                    ),
                // header,
                Expanded(
                  child: Container(
                      padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                      child: GridView.count(
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        crossAxisCount: 2,
                        childAspectRatio: .90,
                        children: [
                          // List.generate(8, (_) {
                          //         return

                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed('transreport');
                            },
                            child: Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  // mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    FlutterLogo(),
                                    Text(
                                      "transportation".tr().toString(),
                                    ),
                                  ],
                                ),
                              ),
                              //   );
                              // }),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed('fuelsreport');
                            },
                            child: Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  // mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    FlutterLogo(),
                                    Text("fuel".tr().toString(),)
                                  ],
                                ),
                              ),
                              //   );
                              // }),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed('carpartsreport');
                            },
                            child: Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  // mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    FlutterLogo(),
                                    Text("maintenance".tr().toString(),)
                                  ],
                                ),
                              ),
                              //   );
                              // }),
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  get dashBg => Column(
        children: <Widget>[
          Expanded(
            child: Container(
              // color: Colors.deepPurple,
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
            ),
            flex: 2,
          ),
          Expanded(
            child: Container(color: Colors.transparent),
            flex: 5,
          ),
        ],
      );

  get content => Container(
        child: Column(
          children: <Widget>[
            header,
            grid,
          ],
        ),
      );

  get header => ListTile(
        contentPadding: EdgeInsets.only(left: 20, right: 20, top: 20),
        title: Text(
          'Dashboard',
          style: TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          '10 items',
          style: TextStyle(color: Colors.blue),
        ),
        trailing: CircleAvatar(),
      );

  get grid => Expanded(
        child: Container(
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: GridView.count(
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              crossAxisCount: 2,
              childAspectRatio: .90,
              children: [
                // List.generate(8, (_) {
                //         return

                GestureDetector(
                  onTap: () {
                    // Navigator.of(context).pushNamed(pageName);
                  },
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[FlutterLogo(), Text('data')],
                      ),
                    ),
                    //   );
                    // }),
                  ),
                ),
              ],
            )),
      );
}
