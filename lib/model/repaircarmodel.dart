import 'package:flutter/foundation.dart';

class RepairCar {
  int? id;
  String? name;
  int? quantity;
  int? price;
  int? datetime;
  String? type;
  String? mechanic;
  int? phone;

  RepairCar({
    @required this.id,
    @required this.name,
    @required this.quantity,
    @required this.price,
    @required this.datetime,
    @required this.type,
    @required this.mechanic,
    @required this.phone,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'quantity': quantity,
      'price': price,
      'datetime': datetime,
      'type': type,
      'mechanic' : mechanic,
      'phone' : phone,
    };
  }
}
