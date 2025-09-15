import 'package:flutter/material.dart';

class MyReportsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> reports = [
      {'title': 'Overflowing Trash Bin', 'status': 'Resolved', 'date': 'Sep 12', 'id': 1},
      {'title': 'Broken Lamp Post', 'status': 'In Progress', 'date': 'Sep 10', 'id': 2},
      {'title': 'Pothole', 'status': 'Pending', 'date': 'Sep 8', 'id': 3},
    ];

    return Scaffold(
      appBar: AppBar(title: Text('My Reports')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: reports.length,
        itemBuilder: (context, i) {
          var r = reports[i];
          return Card(
            child: ListTile(
              leading: Icon(Icons.report, color: Theme.of(context).primaryColor),
              title: Text(r['title']?.toString() ?? ''),
              subtitle: Text('${r['date']?.toString() ?? ''}  |  Status: ${r['status']?.toString() ?? ''}'),
              trailing: Icon(Icons.chevron_right),
              onTap: () => Navigator.pushNamed(context, '/report_details', arguments: r['id']),
            ),
          );
        },
      ),
    );
  }
}
