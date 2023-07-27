import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:oru_phones/main.dart';
import 'package:oru_phones/screens/notification_screen.dart';

Future<void> handleBackgrounMessage(RemoteMessage message) async {
  debugPrint('Title:  ${message.notification?.title}');
  debugPrint('Body:  ${message.notification?.body}');
  debugPrint('Payload:  ${message.data}');
}

class FirebaseApi {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  DateTime dateTime = DateTime.now();

  Future<void> uploadToken(String token) async {
    try {
      await _firebaseFirestore
          .collection('fcm_token')
          .doc(dateTime.toIso8601String())
          .set({"fcm_token": token});
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  final _androidChannel = const AndroidNotificationChannel(
    'high_importance_channel',
    'Hight Importance Notifications',
    description: 'This channel is used for important notifications',
    importance: Importance.high,
  );

  final _localNotifications = FlutterLocalNotificationsPlugin();

  void handleMessage(
    RemoteMessage? message,
  ) {
    if (message == null) {
      return;
    } else {
      navigatorKey.currentState
          ?.pushNamed(NotificationScreen.route, arguments: message);
    }
  }

  Future initLocalNotifications() async {
    const iOS = IOSInitializationSettings();
    const android = AndroidInitializationSettings('@drawable/ic_launcher');
    const settings = InitializationSettings(android: android, iOS: iOS);
    await _localNotifications.initialize(
      settings,
      onSelectNotification: (payload) {
        final message = RemoteMessage.fromMap(jsonDecode(payload!));
        handleMessage(message);
      },
    );
    final platform = _localNotifications.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();

    await platform?.createNotificationChannel(_androidChannel);
  }

  Future initPushNotifications() async {
    await _firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    _firebaseMessaging.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(handleBackgrounMessage);
    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;
      if (notification == null) {
        return;
      } else {
        _localNotifications.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              _androidChannel.id,
              _androidChannel.name,
              channelDescription: _androidChannel.description,
              icon: '@drawable/ic_launcher',
            ),
          ),
          payload: jsonEncode(
            message.toMap(),
          ),
        );
      }
    });
  }

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fcmToken = await _firebaseMessaging.getToken();

    if (fcmToken != null) {
      await uploadToken(fcmToken);
    }

    debugPrint('Token:  $fcmToken');
    initPushNotifications();
    initLocalNotifications();

    FirebaseMessaging.onBackgroundMessage(handleBackgrounMessage);
  }
}
