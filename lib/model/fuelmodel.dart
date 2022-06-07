import 'package:flutter/foundation.dart';

class Fuels {
  int? id;
  String? gasstation;
  int? quantity;
  int? price;
  int? datetime;

  Fuels(
      {@required this.id,
        @required this.gasstation,
        @required this.quantity,
        @required this.price,
        @required this.datetime});

  Map<String, dynamic> toMap() {
    return {
      'gasstation': gasstation,
      'quantity': quantity,
      'price': price,
      'datetime': datetime
    };
  }
}
