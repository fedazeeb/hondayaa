import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationWidget {
  static final _notifications = FlutterLocalNotificationsPlugin();
  static final onNotifications = BehaviorSubject<String?>();

  static Future init({bool scheduled = false}) async {
    var initAndroidSettings =
        AndroidInitializationSettings(/*'mipmap/ic_launcher'*/'drawable/ic_h');
    var iso = IOSInitializationSettings();
    final settings =
        InitializationSettings(iOS: iso, android: initAndroidSettings);
    await _notifications.initialize(settings,
        onSelectNotification: (parload) async {
      onNotifications.add(parload);
    });
    tz.initializeTimeZones();
    // tz.setLocalLocation(tz.getLocation(timeZoneName));
  }

  // void selectNotification(String payload) async {
  //   if (payload != null) {
  //     print('dfdsfgfsgfg ${payload}');
  //   }
  //   await Navigator.of(context).pushReplacementNamed("myhomepage")
  //   );
  // }

  static Future showNotifications({
    var id,
    var title,
    var body,
    var payload,
  }) async =>
      _notifications.show(
        id,
        title,
        body,
        await notificationDetails(),
      );

  static notificationDetails() async {
    return NotificationDetails(
      android: AndroidNotificationDetails(
        'channal id',
        'channal name',
        importance: Importance.max,
      ),
      iOS: IOSNotificationDetails(),
    );
  }

  static Future showScheduledNotifications({
    var id,
    var title,
    var body,
    var payload,
    required DateTime scheduledDate,
  }) async =>
      _notifications.zonedSchedule(
        id,
        title,
        body,
        tz.TZDateTime.from(
          scheduledDate,
          tz.local,
        ),
        await notificationDetails(),
        payload: payload,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
      );

  static Future<void> cancelNotification(int? id)async {
    await _notifications.cancel(id!);
  }
}
