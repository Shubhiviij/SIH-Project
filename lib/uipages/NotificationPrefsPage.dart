
import 'package:flutter/material.dart';

// User-centric page for notification preference toggles
class NotificationPrefsPage extends StatefulWidget {
  @override
  State<NotificationPrefsPage> createState() => _NotificationPrefsPageState();
}

class _NotificationPrefsPageState extends State<NotificationPrefsPage> {
  bool pushEnabled = true;
  bool emailSummary = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notification Preferences')),
      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SwitchListTile(
              value: pushEnabled,
              onChanged: (val) => setState(() => pushEnabled = val),
              title: Text("Push Notifications"),
              secondary: Icon(Icons.notifications_active),
            ),
            Divider(),
            SwitchListTile(
              value: emailSummary,
              onChanged: (val) => setState(() => emailSummary = val),
              title: Text("Email Summary (Weekly)"),
              secondary: Icon(Icons.email_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
