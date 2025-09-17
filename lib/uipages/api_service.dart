import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "http://172.16.23.10:5000"; // Backend laptop IP

  // Get all issues
  static Future<List<dynamic>> fetchIssues() async {
    final response = await http.get(Uri.parse("$baseUrl/issues"));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to load issues");
    }
  }

  // Create a new issue
  static Future<Map<String, dynamic>> createIssue(
      Map<String, dynamic> issueData) async {
    final response = await http.post(
      Uri.parse("$baseUrl/issues"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(issueData),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to create issue");
    }
  }

  // Register a new user
  static Future<Map<String, dynamic>> registerUser({
    required String name,
    required String email,
    required String password,
  }) async {
    print('=== REGISTRATION REQUEST ===');
    print('URL:http://172.16.23.10:5000/api/register');
    print('Name: $name');
    print('Email: $email');
    print('Password: ${password.isNotEmpty ? "[PROVIDED]" : "[EMPTY]"}');

    final response = await http.post(
      Uri.parse("http://172.16.23.10:5000/api/register"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "name": name,
        "email": email,
        "password": password,
      }),
    );

    print('=== REGISTRATION RESPONSE ===');
    print('Status Code: ${response.statusCode}');
    print('Response Headers: ${response.headers}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          "Registration failed (${response.statusCode}): ${response.body}");
    }
  }

  // Login user
  static Future<Map<String, dynamic>> loginUser({
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse("http://172.16.23.10:5000/api/login"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "email": email,
        "password": password,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to login");
    }
  }
}
