import 'package:flutter/material.dart';

class ManageReportsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Explicit typing for safety
    final List<Map<String, dynamic>> reports = [
      {'title': 'Trash Bin Overflow', 'status': 'Pending', 'date': 'Sep 13', 'id': 1},
      {'title': 'Streetlight Out', 'status': 'Assigned', 'date': 'Sep 12', 'id': 2},
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Manage Reports')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: reports.length,
        itemBuilder: (context, i) {
          var r = reports[i];
          return Card(
            child: ListTile(
              leading: Icon(Icons.report_gmailerrorred, color: Colors.redAccent),
              title: Text(r['title']?.toString() ?? ''),
              subtitle: Text('${r['date']?.toString() ?? ''}   |   Status: ${r['status']?.toString() ?? ''}'),
              trailing: Icon(Icons.arrow_forward_ios, size: 18),
              onTap: () {
                Navigator.pushNamed(context, '/report_details', arguments: r['id']);
              },
            ),
          );
        },
      ),
    );
  }
}
