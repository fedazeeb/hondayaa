import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:hondaya/model/repaircarmodel.dart';
import 'package:hondaya/provider/datetimeprovider.dart';
import 'package:hondaya/provider/localprovider.dart';
import 'package:hondaya/provider/themenotifier.dart';
import 'package:hondaya/style/maincolors.dart';
import 'package:hondaya/style/themee.dart';
import 'package:hondaya/ui/alert.dart';
import 'package:hondaya/ui/reports/dashboard.dart';
import 'package:hondaya/ui/reports/repaircarerport.dart';
import 'package:hondaya/ui/services/carparts.dart';
import 'package:hondaya/ui/services/fuel.dart';
import 'package:hondaya/ui/homepage.dart';
import 'package:hondaya/ui/reports/fuelsreport.dart';
import 'package:hondaya/ui/reports/transportationreport.dart';
import 'package:hondaya/ui/services/maintanas.dart';
import 'package:hondaya/ui/services/repaircar.dart';
import 'package:hondaya/ui/services/updatemaintanas.dart';
import 'package:hondaya/ui/settings/about.dart';
import 'package:hondaya/ui/settings/setting.dart';
import 'package:hondaya/ui/splashscreen.dart';
import 'package:hondaya/ui/services/transportation.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // print(prefs.getBool("isDarkTheme"));
  ThemeProvider themeProvider = ThemeProvider();
  themeProvider.initialize();
  themeProvider.initializeThemeColor();

  MainColors mainColors = MainColors();
  mainColors.initialize();

  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('ar', 'SA')],
      path: 'assets/translations',
      // <-- change the path of the translation files
      saveLocale: true,
      fallbackLocale: Locale('ar', 'SA'),
      child: MultiProvider(
        builder: (context, child) {
          return MyApp();
        },
        providers: [
          ChangeNotifierProvider(
            create: (context) => DateTimeProvider(),
          ),
          ChangeNotifierProvider.value(
            value: themeProvider,
          ),
          ChangeNotifierProvider.value(
            value: mainColors,
          ),
          ChangeNotifierProvider(
            create: (context) => ThemeNotifier(darkTheme)..initialize(),
          ),
          // ChangeNotifierProvider(
          //   create: (_) => ThemeProvider(/*
          //       isDarkMode: prefs.getBool("isDarkTheme") == null
          //           ? true
          //           : prefs.getBool("isDarkTheme")!*/)..initialize(),
          // ),
        ],
      ),
    ),
  );

  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MainColors>(context, listen: false);
    final themeNotifier = Provider.of<ThemeNotifier>(context);

//--------------------------------------------------------------
    // return Consumer<ThemeProvider>(
    //   builder: (context, themePovider, child) {
    // print(themePovider.getTheme);
    //-------------------------------------------------------------
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeNotifier.getTheme(),
      //--------------------------------------------------------
      // theme:
      //
      //   ///////////////////////////////////////////
      // ThemeData(
      //   // This is the theme of your application.
      //   //
      //   // Try running your application with "flutter run". You'll see the
      //   // application has a blue toolbar. Then, without quitting the app, try
      //   // changing the primarySwatch below to Colors.green and then invoke
      //   // "hot reload" (press "r" in the console where you ran "flutter run",
      //   // or simply save your changes to "hot reload" in a Flutter IDE).
      //   // Notice that the counter didn't reset back to zero; the application
      //   // is not restarted.
      //   // primarySwatch: provider.primarycolor,//Colors.deepOrange,
      //   // primaryColor: Colors.orange,
      //   // primaryColor: Colors.orange,
      //   // provider.getTopColor,
      // ),
      // ///////////////////////////////////////////
      // darkTheme: themePovider
      //     .getTheme/*== null
      //     ? ThemeData.dark()
      //     : themePovider.getTheme*/
      // ,
      //////////////////////////////////////////////----------------
      //provider.darkTheme,

      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: SafeArea(
        child: SplashScreen(),
      ),
      routes: {
        'myhomepage': (context) => MyHomePage(),
        'splashscreen': (context) => SplashScreen(),
        'mysetting': (context) => MySetting(),
        'transportation': (context) => Transportation(),
        'fuel': (context) => Fuel(),
        'carparts': (context) => CarPartsTab(),
        'transreport': (context) => TransReport(),
        'fuelsreport': (context) => FuelsReport(),
        'maintenance': (context) => Maintenance(),
        'repaircar': (context) => RepairCarTab(),
        'carpartsreport': (context) => CarPartsReport(),
        'dashboardtitle': (context) => Dashboard(),
        'alerts': (context) => Alerat_Page(),
        URepairCar.routeName: (context) => URepairCar(),
        'about': (context) => About(),
      },
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
    //},
    //---------------------------------------------
    // );
    //--------------------------------------------
    // child:
    // );
  }
}
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
