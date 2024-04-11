import 'dart:async';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:math';

class NotificationService {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
  FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    AndroidInitializationSettings initializationSettingsAndroid =
    const AndroidInitializationSettings('flutter');

    var initializationSettingsIOS = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        onDidReceiveLocalNotification:
            (int id, String? title, String? body, String? payload) async {});

    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    await notificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse:
            (NotificationResponse notificationResponse) async {});
  }

  notificationDetails() {
    return const NotificationDetails(
        android: AndroidNotificationDetails('channelId', 'channelName',
            importance: Importance.max),
        );
  }
  final List<String> motivationTexts = [
    "Die Zeit heilt alle Wunden. 🌟",
    "Die Zukunft hält für dich viele positive Überraschungen bereit.🌈",
    "Du bist nicht allein. Freunde und Familie stehen hinter dir.🤗",
    "Jeder Tag, an dem du aufstehst, ist ein Sieg. 🌞",
    "Lass die Vergangenheit los und konzentriere dich auf das Hier und Jetzt.🌺",
    "Selbstliebe ist der Schlüssel zur Heilung.❤️",
    "Jede Trennung öffnet die Tür zu neuen Chancen.🚪",
    "Die Liebe zu dir selbst ist die wichtigste Liebe.🌱",
    "Du bist einzigartig und wertvoll.✨",
    "Vertraue darauf, dass das Universum für dich arbeitet.🌌",
    "Akzeptiere die Veränderung. Du bist flexibel und stark. 💪",
    "Denke daran, dass du mehr bist als deine vergangenen Beziehungen.🌟",
    "Deine Geschichte hört hier nicht auf.📖",
    "Das Ende einer Beziehung ist nicht das Ende deiner Geschichte.🌅",
    "Die Liebe zu dir selbst ist die beste Medizin.🛁",
    "Dein Glück hängt nicht von anderen ab. ☀️",
    "Vertraue dem Timing des Lebens. Alles passiert aus einem Grund.🕰️",
    "Du bist auf dem Weg zur besten Version deiner selbst.🚀",
    "Halte durch und umarme die positive Energie, die kommt. 🌞",
  ];

  Future<void> showRandomMotivationNotification() async {
    final Random random = Random();
    final int randomId = random.nextInt(999999);
    final int randomIndex = random.nextInt(motivationTexts.length);
    final String randomMotivationText = motivationTexts[randomIndex];
    print(randomMotivationText);
    await notificationsPlugin.show(
      randomId,
      "Motivation",
      randomMotivationText,
      await notificationDetails(),
    );
  }
}
