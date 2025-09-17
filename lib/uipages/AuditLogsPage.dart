
import 'package:flutter/material.dart';

// Admin-visible system action trail: track changes, access, escalations
class AuditLogsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Demo events, highlight type with icons/colors
    final logs = [
      {'event': 'Staff login', 'actor': 'Priya S.', 'timestamp': '09:10 AM'},
      {'event': 'Report assigned', 'actor': 'Admin', 'timestamp': '08:43 AM'},
      {'event': 'User added', 'actor': 'System', 'timestamp': 'Yesterday'},
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Audit Logs')),
      body: ListView.separated(
        padding: const EdgeInsets.all(22),
        itemCount: logs.length,
        separatorBuilder: (ctx, i) => Divider(),
        itemBuilder: (ctx, i) => ListTile(
          leading: Icon(Icons.event_note, color: Colors.deepOrange),
          title: Text(logs[i]['event']!),
          subtitle: Text('${logs[i]['actor']} • ${logs[i]['timestamp']}'),
        ),
      ),
    );
  }
}
