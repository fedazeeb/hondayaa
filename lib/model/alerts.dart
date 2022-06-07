import 'package:flutter/foundation.dart';

class Alerts {
  int? id;
  String? title;
  String? description;
  int? datetime;
  int? pushid;

  Alerts({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.datetime,
    @required this.pushid,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'datetime': datetime,
      'pushid': pushid,
    };
  }
}
