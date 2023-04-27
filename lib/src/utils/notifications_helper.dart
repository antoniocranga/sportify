import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:sportify/src/ui/flow/football/match/match_screen.dart';

class NotificationsHelper {
  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  static const AndroidNotificationChannel _channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.max,
  );
  static final GlobalKey<NavigatorState> navigatorState =
      GlobalKey<NavigatorState>();

  Future<void> initialize() async {
    await _flutterLocalNotificationsPlugin.initialize(
        const InitializationSettings(
            android: AndroidInitializationSettings('@mipmap/ic_launcher')),
        onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
        onDidReceiveBackgroundNotificationResponse:
            onDidReceiveNotificationResponse);
    _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(_channel);
  }

  static void onDidReceiveNotificationResponse(
      NotificationResponse notificationResponse) {
    final int matchId = int.parse(notificationResponse.payload!);
    Navigator.push(navigatorState.currentContext!,
        MaterialPageRoute(builder: (context) => MatchScreen(id: matchId)));
  }

  static Future<void> onBackgroundMessage(RemoteMessage message) async {
    await Firebase.initializeApp();

    log("Handling a background message: ${message.messageId}");
  }

  static Future<void> onForegroundMessage(RemoteMessage message) async {
    log("Got a message while in the foreground!");
    log("Message data: ${message.data}");

    if (message.notification != null) {
      log("Message also comntained a notification: ${message.notification}");

      RemoteNotification? notification = message.notification;
      AndroidNotification? androidNotification = notification?.android;

      if (notification != null && androidNotification != null) {
        _flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
                android: AndroidNotificationDetails(
              _channel.id,
              _channel.name,
              channelDescription: _channel.description,
              importance: Importance.max,
              icon: androidNotification.smallIcon,
            )),
            payload: message.data['matchId']);
      }
    }
  }

  static Future<void> onMessageOpenedApp(RemoteMessage message) async {
    log("[onmEssageOpenedApp] ${message.data}");
    final int matchId = int.parse(message.data['matchId']);
    Navigator.push(navigatorState.currentContext!,
        MaterialPageRoute(builder: (context) => MatchScreen(id: matchId)));
  }
}
