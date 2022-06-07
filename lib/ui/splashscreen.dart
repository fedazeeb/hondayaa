import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hondaya/ui/widget/waveclipper.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      setState(() {
        _opacity = 1.0;
      });
    });
    Timer(const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacementNamed("myhomepage"));
  }

  @override
  Widget build(BuildContext context) {
    double x = MediaQuery.of(context).size.width;
    double y = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: <Widget>[
                //stack overlaps widgets
                Opacity(
                  //semi red clippath with more height and with 0.5 opacity
                  opacity: 0.5,
                  child: ClipPath(
                    clipper: WaveClipper(), //set our custom wave clipper
                    child: Container(
                      color: Colors.black,
                      height: y * 1.6, // 45
                    ),
                  ),
                ),

                ClipPath(
                  //upper clippath with less height
                  clipper: WaveClipper(), //set our custom wave clipper.
                  child: Container(
                    padding: EdgeInsets.only(bottom: 50),
                    color: Colors.red,
                    height: y * 1.57,
                    // 4
                    alignment: Alignment.center,
                    child: AnimatedOpacity(
                      duration: const Duration(seconds: 5),
                      opacity: _opacity,
                      curve: Curves.bounceInOut,
                      child: CircleAvatar(
                        backgroundColor: Colors.black54,
                        radius: 120,
                        child: CircleAvatar(
                          radius: 110,
                          backgroundColor: Colors.white,
                          // backgroundImage: AssetImage('images/minitruck.png'),
                          child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage('images/minitruck.png'),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: y * 0.10),
              child: Text(
                "Hondaya",
                style: TextStyle(
                  fontSize: 50,
                  //   color: Colors.black,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'DancingScript',
                  foreground: Paint()
                    ..shader = LinearGradient(
                      colors: <Color>[
                        Colors.black,
                        Colors.redAccent,
                      ],
                    ).createShader(
                      Rect.fromLTWH(0.0, 0.0, 300.0, 100.0),
                    ),
                ),
              ),
            )
          ],
          // Image.asset('images/alert.jpg'),
        ),
      ),
    );
  }
}
