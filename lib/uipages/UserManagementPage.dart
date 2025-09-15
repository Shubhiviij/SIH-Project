import 'package:flutter/material.dart';

// Manage all users (citizens + staff), search, reset passwords, set roles
class UserManagementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace with paged/fetched user list for production
    final users = [
      {'name': 'Aman Jain', 'email': 'aman@mail.com', 'type': 'Citizen'},
      {'name': 'Riya M.', 'email': 'riya@admin.com', 'type': 'Staff'},
    ];

    return Scaffold(
      appBar: AppBar(title: Text('User Management')),
      body: ListView.builder(
        padding: const EdgeInsets.all(18),
        itemCount: users.length,
        itemBuilder: (ctx, i) => Card(
          child: ListTile(
            leading: Icon(
              users[i]['type'] == 'Citizen' ? Icons.person : Icons.engineering,
              color: Colors.blueAccent,
            ),
            title: Text(users[i]['name']!),
            subtitle: Text(users[i]['email']!),
            trailing: PopupMenuButton<String>(
              onSelected: (val) { /* Reset password, etc. */ },
              itemBuilder: (ctx) => [
                PopupMenuItem(value: 'reset_password', child: Text('Reset Password')),
                PopupMenuItem(value: 'remove', child: Text('Remove User')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
