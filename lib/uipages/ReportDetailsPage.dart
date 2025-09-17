
import 'package:flutter/material.dart';

// Timeline/details for each individual report. Accepts reportId as argument.
class ReportDetailsPage extends StatelessWidget {
  final int? reportId;
  const ReportDetailsPage({Key? key, this.reportId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Example: Use received reportId. Replace this with actual data fetch logic in production
    final Map<String, dynamic> details = {
      'title': 'Overflowing Trash Bin (Report ID: ${reportId?.toString() ?? ""})',
      'status': 'Resolved',
      'submitted_on': 'Sep 12, 2025',
      'history': [
        {'event': 'Submitted', 'date': 'Sep 12, 8:00 AM'},
        {'event': 'Acknowledged', 'date': 'Sep 12, 9:00 AM'},
        {'event': 'Assigned to Sanitation', 'date': 'Sep 12, 9:30 AM'},
        {'event': 'Resolved', 'date': 'Sep 13, 2:00 PM'},
      ],
      'id': reportId,
    };

    return Scaffold(
      appBar: AppBar(
        title: Text(details['title']?.toString() ?? ''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Status: ${details['status']?.toString() ?? ''}", style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text("Submitted on: ${details['submitted_on']?.toString() ?? ''}", style: TextStyle(color: Colors.grey)),
            SizedBox(height: 20),
            Text("Timeline", style: Theme.of(context).textTheme.titleMedium),
            ...List<Widget>.from(
              (details['history'] as List).map((h) =>
                  ListTile(
                    leading: Icon(Icons.arrow_right),
                    title: Text((h['event']?.toString() ?? '')),
                    subtitle: Text((h['date']?.toString() ?? '')),
                  ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                ElevatedButton.icon(
                  icon: Icon(Icons.message),
                  label: Text("Comments"),
                  onPressed: () {
                    Navigator.pushNamed(context, '/comment_thread', arguments: details['id']);
                  },
                ),
                SizedBox(width: 10),
                ElevatedButton.icon(
                  icon: Icon(Icons.image),
                  label: Text("Attachments"),
                  onPressed: () {
                    Navigator.pushNamed(context, '/attachment_gallery', arguments: details['id']);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
