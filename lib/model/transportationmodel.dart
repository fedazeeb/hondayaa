import 'package:flutter/foundation.dart';

class Trans {
  int? id;
  String? ffrom;
  String? tto;
  int? distance;
  int? rent;
  int? datetime;

  Trans(
      {@required this.id,
      @required this.ffrom,
      @required this.tto,
      @required this.distance,
      @required this.rent,
      @required this.datetime});

  Map<String, dynamic> toMap() {
    return {
      'ffrom': ffrom,
      'tto': tto,
      'distance': distance,
      'rent': rent,
      'datetime': datetime
    };
  }
}
