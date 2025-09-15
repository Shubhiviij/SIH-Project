import 'package:flutter/material.dart';

// List release notes and updates for transparency to users/admins
class AppUpdatesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Example update log records
    final updates = [
      {'date': 'Sep 2025', 'desc': 'Major UI redesign and performance improvements.'},
      {'date': 'Aug 2025', 'desc': 'Live Map and Push Notifications added.'},
    ];

    return Scaffold(
      appBar: AppBar(title: Text('App Updates & Release Notes')),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: updates.length,
        separatorBuilder: (ctx, i) => Divider(),
        itemBuilder: (ctx, i) =>
            ListTile(
              leading: Icon(Icons.new_releases, color: Colors.green),
              title: Text(updates[i]['date']!),
              subtitle: Text(updates[i]['desc']!),
            ),
      ),
    );
  }
}
