import 'package:flutter/material.dart';

class DepartmentPerformancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Use explicit Map<String, dynamic> for items
    final List<Map<String, dynamic>> depts = [
      {'dept': 'Sanitation', 'resolved': 34, 'pending': 6},
      {'dept': 'Public Works', 'resolved': 21, 'pending': 2},
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Dept. Performance')),
      body: ListView.builder(
        padding: const EdgeInsets.all(22),
        itemCount: depts.length,
        itemBuilder: (context, i) => Card(
          child: ListTile(
            leading: Icon(Icons.account_balance, color: Colors.teal),
            title: Text(depts[i]['dept']?.toString() ?? ''),
            subtitle: Text(
              'Resolved: ${depts[i]['resolved']?.toString() ?? '0'} | Pending: ${depts[i]['pending']?.toString() ?? '0'}',
            ),
          ),
        ),
      ),
    );
  }
}
