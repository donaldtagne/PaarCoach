import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'noo.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  bool enableNotifications = true;
  bool reminders = false;
  bool expertNotifications = true;
  bool communityNotifications = false;
  bool dailyNotifications = false;
  late Timer _timer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: GoogleFonts.robotoSerif(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildNotificationTile(
            'Enable Notifications',
            enableNotifications,
                (value) {
              setState(() {
                enableNotifications = value;
              });
            },
          ),
          SizedBox(height: 10.0), // Add padding between items
          ListTile(
            title: Text(
              'Notify me Reminders',
              style: GoogleFonts.robotoSerif(
                fontSize: 16,
                color: Colors.black26,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          _buildNotificationTile(
            'Experten notifications',
            expertNotifications,
                (value) {
              setState(() {
                expertNotifications = value;
              });
            },
          ),
          _buildNotificationTile(
            'Communitys notifications',
            communityNotifications,
                (value) {
              setState(() {
                communityNotifications = value;
              });
            },
          ),
          _buildNotificationTile(
            'Daily notifications',
            dailyNotifications,
                (value) {
              setState(() {
                dailyNotifications = value;
                if (dailyNotifications) {
                  _timer = Timer.periodic(Duration(minutes:1), (timer) {
                    NotificationService().showRandomMotivationNotification();
                  });
                } else {
                  _timer.cancel();
                }
              });
            },
          ),
        ],
      ),
    );
  }

  ListTile _buildNotificationTile(String title, bool value, Function(bool) onChanged) {
    return ListTile(
      title: Text(
        title,
        style: GoogleFonts.robotoSerif(
          fontSize: 16,
          color: Colors.black,
        ),
      ),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}


