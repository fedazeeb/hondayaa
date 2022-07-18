import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home_Card extends StatelessWidget {
  final String imageName;
  final String pageName;

  const Home_Card({Key? key, required this.imageName, required this.pageName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.red,
      onTap: () {
        print('Inkwell');
        Navigator.of(context).pushNamed(pageName);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          // color: Colors.blue,
          child: Container(
              width: double.infinity * 0.5,
              height: MediaQuery.of(context).size.height * 0.20,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imageName),
                  fit: BoxFit.contain,
                ),
              ),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Text(
                  pageName.tr().toString(),
                  style: const TextStyle(
                    fontSize: 20,
                    fontFamily: "SEGOEUI",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ])
              //       Navigator.of(context).pushReplacementNamed("validations");
              // child: Column(
              //   children: [
              //     Text(
              //       pageName.tr().toString(),
              //       style: const TextStyle(
              //         fontSize: 20,
              //         fontWeight: FontWeight.bold,
              //         shadows: [
              //           Shadow(
              //             color: Colors.black54,
              //             blurRadius: 10.0,
              //             offset: Offset(5.0, 5.0),
              //           )
              //         ],
              //       ),
              //     ),
              //   ],
              // ),
              ),
        ),
      ),
    );
  }
}
