import 'package:flutter/material.dart';

// FAQ/help center for common questions and contact info
class HelpFaqPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final faq = [
      {'q': 'How do I report an issue?', 'a': 'Tap "Submit Report" and fill in the details.'},
      {'q': 'How to track my report?', 'a': 'Go to "My Reports" and tap the report.'},
      {'q': 'Who sees my reports?', 'a': 'Only municipal admins and staff.'},
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Help & FAQ')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ...faq.map((f) => ExpansionTile(
            leading: Icon(Icons.help_outline, color: Colors.blueAccent),
            title: Text(f['q']!),
            children: [Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(f['a']!),
            )],
          )),
          SizedBox(height: 22),
          ListTile(
            leading: Icon(Icons.contact_mail),
            title: Text("Contact Support"),
            subtitle: Text("support@civicapp.com"),
          ),
        ],
      ),
    );
  }
}
