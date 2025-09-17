
import 'package:flutter/material.dart';

// Admin CRUD interface for municipal staff. Add/edit/disable staff accounts.
class StaffManagementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Sample staff listing; use dynamic data in production
    final staff = [
      {'name': 'Priya S.', 'role': 'Sanitation Lead', 'status': 'Active'},
      {'name': 'Raj V.', 'role': 'Electrical', 'status': 'Inactive'},
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Staff Management')),
      body: ListView.separated(
        padding: const EdgeInsets.all(18),
        itemCount: staff.length,
        separatorBuilder: (ctx, i) => Divider(),
        itemBuilder: (ctx, i) => ListTile(
          leading: Icon(Icons.person_outline, color: Colors.teal),
          title: Text(staff[i]['name']!),
          subtitle: Text('${staff[i]['role']} — ${staff[i]['status']}'),
          trailing: PopupMenuButton<String>(
            onSelected: (val) { /* Handle actions here */ },
            itemBuilder: (ctx) => [
              PopupMenuItem(value: 'edit', child: Text('Edit')),
              PopupMenuItem(value: 'disable', child: Text('Disable')),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: 'Add New Staff',
        onPressed: () {
          // Show add staff form or dialog
        },
      ),
    );
  }
}
