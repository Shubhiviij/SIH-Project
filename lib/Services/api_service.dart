import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "http://192.168.115.1:5000";  // Backend laptop IP // change to your IP if on real device

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
  static Future<Map<String, dynamic>> createIssue(Map<String, dynamic> issueData) async {
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
}