import 'package:flutter/material.dart';
import 'api_service.dart';

// Login page with citizen/admin toggle and secure auth process

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

enum UserType { Citizen, Admin }

class _LoginPageState extends State<LoginPage> {
  UserType _selectedType = UserType.Citizen;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email = '', _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        // Main login container
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24)),
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 32, vertical: 38),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.account_circle,
                        size: 60, color: Theme.of(context).primaryColor),
                    SizedBox(height: 8),
                    Text('Login',
                        style: Theme.of(context).textTheme.headlineSmall),
                    SizedBox(height: 20),
                    ToggleButtons(
                      isSelected: [
                        _selectedType == UserType.Citizen,
                        _selectedType == UserType.Admin
                      ],
                      onPressed: (index) {
                        setState(() {
                          _selectedType = UserType.values[index];
                        });
                      },
                      borderRadius: BorderRadius.circular(20),
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 26, vertical: 8),
                          child:
                          Row(children: [Icon(Icons.person), Text(' Citizen')]),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 26, vertical: 8),
                          child: Row(children: [
                            Icon(Icons.admin_panel_settings),
                            Text(' Admin')
                          ]),
                        ),
                      ],
                    ),
                    SizedBox(height: 22),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Email',
                                prefixIcon: Icon(Icons.email)),
                            validator: (val) => (val == null || !val.contains('@'))
                                ? "Enter valid email"
                                : null,
                            onSaved: (val) => _email = val ?? '',
                          ),
                          SizedBox(height: 18),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Password',
                                prefixIcon: Icon(Icons.lock)),
                            obscureText: true,
                            validator: (val) => (val == null || val.length < 6)
                                ? "Password too short"
                                : null,
                            onSaved: (val) => _password = val ?? '',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 44),
                        backgroundColor: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14)),
                      ),
                      icon: Icon(Icons.login),
                      label: Text('Login'),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();

                          try {
                            final role = _selectedType == UserType.Admin
                                ? "admin"
                                : "citizen";

                            final response = await ApiService.loginUser(
                              email: _email,
                              password: _password,
                            );

                            if (response['success'] == true) {
                              if (role == "admin") {
                                Navigator.pushReplacementNamed(
                                    context, '/admin_dashboard');
                              } else {
                                Navigator.pushReplacementNamed(
                                    context, '/user_dashboard');
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(response['message'] ??
                                        "Login failed")),
                              );
                            }
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Error: $e")),
                            );
                          }
                        }
                      },
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () =>
                              Navigator.pushNamed(context, '/register'),
                          child: Text('Sign Up'),
                        ),
                        TextButton(
                          onPressed: () =>
                              Navigator.pushNamed(context, '/forgot_password'),
                          child: Text('Forgot Password?'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
