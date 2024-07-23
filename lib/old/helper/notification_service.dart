import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
  FlutterLocalNotificationsPlugin();
  static BuildContext? context;
  // static
  static void initialize() {
    const InitializationSettings initializationSettings =
    InitializationSettings(
        android: AndroidInitializationSettings("@mipmap/ic_launcher"),
        iOS: IOSInitializationSettings(
          requestSoundPermission: true,
          requestBadgePermission: true,
          requestAlertPermission: true,
        ));

    _notificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String? route) async {
          // if (route != null) {
          //   // Navigator.of(context).pushNamed('/');
          //
          //   try{
          //     notificationClickHandler(context!,  Notificationss(
          //         path: route.toString()
          //     ));
          //   }catch(e){print("ERR NOTIFICATION :: " + e.toString());}
          //   print(route);
          // }
        });
  }

  static void display(RemoteMessage message, BuildContext _context) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      context = _context;
      const NotificationDetails notificationDetails = NotificationDetails(
          android: AndroidNotificationDetails("Story", "Story channel",
              channelDescription: "this is our channel",
              importance: Importance.max,
              priority: Priority.high,
              playSound: true,
              enableVibration: true),
          iOS: IOSNotificationDetails(
            presentBadge: true,
            presentSound: true,
            presentAlert: true,
          ));

      await _notificationsPlugin.show(
          id,
          message.notification!.title.toString(),
          message.notification!.body.toString(),
          notificationDetails,
          payload: message.data["path"].toString());
    } on Exception catch (e) {
      print(e);
      // TODO
    }
  }
}
