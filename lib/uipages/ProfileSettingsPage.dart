import 'package:flutter/material.dart';

// User profile and configurable settings (edit profile, notification prefs)

class ProfileSettingsPage extends StatefulWidget {
  @override
  State<ProfileSettingsPage> createState() => _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends State<ProfileSettingsPage> {
  final _formKey = GlobalKey<FormState>();

  String _name = 'User Name', _email = 'user@mail.com';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile & Settings')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            children: [
              Icon(Icons.person, size: 70, color: Theme.of(context).primaryColor),
              SizedBox(height: 20),
              TextFormField(
                initialValue: _name,
                decoration: InputDecoration(labelText: 'Full Name', prefixIcon: Icon(Icons.person)),
                onSaved: (val) => _name = val ?? '',
              ),
              SizedBox(height: 16),
              TextFormField(
                initialValue: _email,
                decoration: InputDecoration(labelText: 'Email', prefixIcon: Icon(Icons.email)),
                onSaved: (val) => _email = val ?? '',
              ),
              SizedBox(height: 28),
              ElevatedButton.icon(
                icon: Icon(Icons.save),
                label: Text("Save"),
                style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 44)),
                onPressed: () {
                  _formKey.currentState?.save();
                  // Update/save to backend here
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Profile updated!")),
                  );
                },
              ),
              SizedBox(height: 22),
              ListTile(
                leading: Icon(Icons.notifications),
                title: Text("Notification Preferences"),
                trailing: Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.pushNamed(context, '/notification_prefs');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}