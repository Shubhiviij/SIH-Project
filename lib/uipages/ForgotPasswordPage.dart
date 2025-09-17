
import 'package:flutter/material.dart';

// Forgot/reset password page for citizen and admin

class ForgotPasswordPage extends StatefulWidget {
  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reset Password'), leading: BackButton()),
      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.lock_reset_rounded, size: 48, color: Theme.of(context).primaryColor),
                SizedBox(height: 14),
                Text(
                  'Enter your registered email address below.',
                  style: TextStyle(color: Colors.black.withOpacity(0.7)),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Form(
                  key: _formKey,
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: 'Email address',
                    ),
                    validator: (val) => (val == null || !val.contains('@')) ? 'Invalid email' : null,
                    onSaved: (val) => _email = val ?? '',
                  ),
                ),
                SizedBox(height: 26),
                ElevatedButton.icon(
                  icon: Icon(Icons.send),
                  label: Text('Send Reset Link'),
                  style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 44)),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // Implement send reset logic here
                      Navigator.pop(context); // Optionally confirm with a dialog
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
