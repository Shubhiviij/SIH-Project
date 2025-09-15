import 'package:flutter/material.dart';

// Citizen registration page with field validation and account creation logic

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  String _fullname = '', _email = '', _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up'), leading: BackButton()),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 24),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.person_add_alt_1, size: 48, color: Theme.of(context).primaryColor),
                  SizedBox(height: 15),
                  TextFormField(
                    decoration: InputDecoration(prefixIcon: Icon(Icons.person), labelText: 'Full Name'),
                    onSaved: (val) => _fullname = val ?? '',
                    validator: (val) => (val == null || val.isEmpty) ? 'Enter name' : null,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(prefixIcon: Icon(Icons.email), labelText: 'Email'),
                    onSaved: (val) => _email = val ?? '',
                    validator: (val) => (val == null || !val.contains('@')) ? 'Enter valid email' : null,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(prefixIcon: Icon(Icons.lock), labelText: 'Password'),
                    obscureText: true,
                    onSaved: (val) => _password = val ?? '',
                    validator: (val) => (val == null || val.length < 6) ? 'Minimum 6 characters' : null,
                  ),
                  SizedBox(height: 26),
                  ElevatedButton.icon(
                    icon: Icon(Icons.app_registration),
                    label: Text("Register"),
                    style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 44)),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        // Implement registration logic here
                        Navigator.pop(context); // Back to login/landing
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
