import 'package:flutter/material.dart';

// Unified notifications and alerts relevant to the user
class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Sample notifications; replace with dynamic backend feed
    final notifications = [
      {'title': 'Report resolved!', 'detail': 'Your pothole issue is now fixed.', 'date': 'Today'},
      {'title': 'Sanitation Assigned', 'detail': 'Overflowing bin assigned to staff.', 'date': 'Yesterday'},
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Notifications')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: notifications.length,
        itemBuilder: (ctx, i) => Card(
          child: ListTile(
            leading: Icon(Icons.notifications_active, color: Colors.blueAccent),
            title: Text(notifications[i]['title']!),
            subtitle: Text('${notifications[i]['detail']!}\n${notifications[i]['date']!}'),
            isThreeLine: true,
          ),
        ),
      ),
    );
  }
}
