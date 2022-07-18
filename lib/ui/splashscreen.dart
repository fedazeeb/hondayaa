import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hondaya/ui/widget/waveclipper.dart';
import 'package:provider/provider.dart';

import '../provider/localprovider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 0.0;

  // final provider = Provider.of<LocaleProvider>(context);

  // void getCurrentThemeData() async {
  //   final theme = ThemeProvider();
  //   await theme.initialize();
  //
  //   print('--------*********  Sharred Preferancess  *************------------');
  //   print(theme.getTheme);
  // }

  @override
  void initState(){
    super.initState();

    // getCurrentThemeData();

    // provider.fetchProvider();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      setState(() {
        _opacity = 1.0;
      });
    });
    Timer(const Duration(seconds: 2),
        () => Navigator.of(context).pushReplacementNamed("myhomepage"));
  }

  @override
  Widget build(BuildContext context) {
    double x = MediaQuery.of(context).size.width;
    double y = MediaQuery.of(context).size.width;

    // final provider = Provider.of<LocaleProvider>(context, listen: false);
    // // final provider = Provider.of<LocaleProvider>(context);
    // //
    // provider.fetchProvider();

    return Scaffold(
      // backgroundColor: Colors.white,
      body:
          // Column(
          //   // mainAxisAlignment: MainAxisAlignment.start,
          //   children: [
          Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/Splash.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Positioned(
                    left: 20,
                    top: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'My Car',
                          style: TextStyle(
                            fontSize: 37,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(''),
                        Text(
                          'Service that you and your',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'vechicle provide',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Positioned(
                    bottom: 20,
                    left: 0,
                    right: 0,
                    child: Text(
                      'Version 1.0',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              )
              // Stack(
              //   children: <Widget>[
              //////////////////////////////////////////////////////////////
              //stack overlaps widgets
              // Opacity(
              //   //semi red clippath with more height and with 0.5 opacity
              //   opacity: 0.5,
              //   child: ClipPath(
              //     clipper: WaveClipper(), //set our custom wave clipper
              //     child: Container(
              //       color: Colors.black,
              //       height: y * 1.6, // 45
              //     ),
              //   ),
              // ),
//////////////////////////////////////////////////////////
              // ClipPath(
              //   //upper clippath with less height
              //   clipper: WaveClipper(), //set our custom wave clipper.
              //   child: Container(
              //     padding: EdgeInsets.only(bottom: 50),
              //     color: Colors.red,
              //     height: y * 1.57,
              //     // 4
              //     alignment: Alignment.center,
              //     child: AnimatedOpacity(
              //       duration: const Duration(seconds: 5),
              //       opacity: _opacity,
              //       curve: Curves.bounceInOut,
              //       child: CircleAvatar(
              //         backgroundColor: Colors.black54,
              //         radius: 120,
              //         child: CircleAvatar(
              //           radius: 110,
              //           backgroundColor: Colors.white,
              //           // backgroundImage: AssetImage('images/minitruck.png'),
              //           child: Container(
              //             decoration: const BoxDecoration(
              //               shape: BoxShape.circle,
              //               image: DecorationImage(
              //                 image: AssetImage('images/minitruck.png'),
              //                 fit: BoxFit.contain,
              //               ),
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              //   ],
              // ),
              ),
      //     Padding(
      //       padding: EdgeInsets.only(top: y * 0.10),
      //       child: Text(
      //         "Hondaya",
      //         style: TextStyle(
      //           fontSize: 50,
      //           //   color: Colors.black,
      //           fontWeight: FontWeight.w900,
      //           fontFamily: 'DancingScript',
      //           foreground: Paint()
      //             ..shader = LinearGradient(
      //               colors: <Color>[
      //                 Colors.black,
      //                 Colors.redAccent,
      //               ],
      //             ).createShader(
      //               Rect.fromLTWH(0.0, 0.0, 300.0, 100.0),
      //             ),
      //         ),
      //       ),
      //     )
      //   ],
      //   // Image.asset('images/alert.jpg'),
      // ),
    );
  }
}
