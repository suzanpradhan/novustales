import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';

import '../helper/notification_service.dart';

class NotificationRoute {
  static NavigationNavigateService(context) {
    // late CommonViewModel _commonViewModel;

    // _commonViewModel = Provider.of<CommonViewModel>(context, listen: false);
    // _commonViewModel.fetchNotifications();

    // FirebaseMessaging.onBackgroundMessage(backgroundHandler);
    print("FIREBASSS");
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    FirebaseMessaging.instance.getInitialMessage().then((message) {
      final routeFromMessage = message?.data["path"];

      if (message != null) {
        // _commonViewModel.setDot(true);
        // notificationClickHandler(context, Notificationss(
        //   path: routeFromMessage,
        // ));
      }
    });

    //foreground message
    FirebaseMessaging.onMessage.listen((message) {
      if (message.notification != null) {
        // _commonViewModel.setDot(true);
        final routeFromMessage = message.data["path"];
        // notificationClickHandler(context, Notificationss(
        //   path: routeFromMessage,
        // ));
      }
      LocalNotificationService.display(message, context);
    });

    //when app is in background and user taps
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      final routeFromMessage = message.data["path"];
      // _commonViewModel.setDot(true);
      // notificationClickHandler(context, Notificationss(
      //   path: routeFromMessage,
      // ));
    });
  }
}
