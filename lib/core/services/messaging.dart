import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:pay_me_mobile/core/constants/colors.dart';

class Messaging {
  static void setupInteractedMessage() {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("Message clicked!");
      // Navigate to specific page based on `message.data`
    });
  }

  static void registerNotification() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Received a message in the foreground!");
      print("Message data: ${message.data}");

      if (message.notification != null) {
        showSimpleNotification(
          Text(message.notification?.title ?? ""),
          subtitle: Text(message.notification?.body ?? ""),
          background: AppColors.lightGreen,
          foreground: Colors.white,
          duration: const Duration(seconds: 2),
        );
        print("Notification body: ${message.notification?.body}");
        print("Notification title: ${message.notification?.title}");
      }
    });

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  static void checkForInitialMessage() async {
    await Firebase.initializeApp();
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      showSimpleNotification(
        Text(initialMessage.notification?.title ?? ""),
        subtitle: Text(initialMessage.notification?.body ?? ""),
        background: AppColors.lightGreen,
        foreground: Colors.white,
        duration: const Duration(seconds: 2),
      );
      print("Notification body: ${initialMessage.notification?.body}");
      print("Notification title: ${initialMessage.notification?.title}");
    }
  }

  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    await Firebase.initializeApp();
    print("Handling a background message: ${message.messageId}");
  }
}
