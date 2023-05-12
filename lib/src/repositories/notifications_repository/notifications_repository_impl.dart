import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sportify/src/repositories/notifications_repository/notifications_repository.dart';
import 'package:sportify/src/utils/notifications_helper.dart';

final notificationsRepositoryProvider =
    Provider<NotificationsRepository>((ref) => NotificationsRepositoryImpl());

class NotificationsRepositoryImpl extends NotificationsRepository {
  NotificationsRepositoryImpl();

  @override
  Future<void> initialize() async {
    try {
      log("[FIREBASE_MESSAGING] initialize()");
      NotificationSettings notificationSettings =
          await FirebaseMessaging.instance.requestPermission(
              alert: true,
              announcement: true,
              badge: true,
              carPlay: false,
              criticalAlert: false,
              sound: false,
              provisional: false);
      log("[FiREBASE_MESAGING] ${notificationSettings.authorizationStatus}");
      switch (notificationSettings.authorizationStatus) {
        case AuthorizationStatus.authorized:
          FirebaseMessaging.onMessage
              .listen(NotificationsHelper.onForegroundMessage);
          FirebaseMessaging.onBackgroundMessage(
              NotificationsHelper.onBackgroundMessage);
          FirebaseMessaging.onMessageOpenedApp
              .listen(NotificationsHelper.onMessageOpenedApp);
          break;
        case AuthorizationStatus.denied:
          // TODO: Handle this case.
          break;
        case AuthorizationStatus.notDetermined:
          // TODO: Handle this case.
          break;
        case AuthorizationStatus.provisional:
          // TODO: Handle this case.
          break;
      }
    } catch (e) {
      log("[ERROR]: $e");
    }
  }

  @override
  Future<void> subscribeToTopic(String topic) async {
    await FirebaseMessaging.instance.subscribeToTopic(topic);
  }

  @override
  Future<void> unsubscribeFromTopic(String topic) async {
    await FirebaseMessaging.instance.unsubscribeFromTopic(topic);
  }
}
