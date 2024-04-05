import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

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
        print("Notification body: ${message.notification?.body}");
        print("Notification title: ${message.notification?.title}");
      }
    });

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    await Firebase.initializeApp();
    print("Handling a background message: ${message.messageId}");
  }
}
