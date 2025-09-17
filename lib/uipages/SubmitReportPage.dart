import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SubmitReportPage extends StatefulWidget {
  const SubmitReportPage({super.key});

  @override
  State<SubmitReportPage> createState() => _SubmitReportPageState();
}

class _SubmitReportPageState extends State<SubmitReportPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _descriptionController = TextEditingController();
  bool _isSubmitting = false;

  // ✅ Function to send issue to backend
  Future<void> _submitReport() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSubmitting = true);

    try {
      final response = await http.post(
        Uri.parse("http://10.111.118.123:5000/api/issues"), // replace with backend laptop IP
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "title": "Title here",
          "description": _descriptionController.text,
          "category": "Other",
          "latitude": 0.0,   // or remove if not needed
          "longitude": 0.0,  // or remove if not needed
          "address": "",
          "image_url": "",
          "reported_by": "User"
        }),
      );



      print("Response Code: ${response.statusCode}");

      print("Response Body: ${response.body}");


      if (response.statusCode == 201 || response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("✅ Report submitted successfully!")),
        );
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("❌ Failed to submit: ${response.body}")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("⚠ Error: $e")),
      );
    } finally {
      setState(() => _isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Report an Issue')),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // 🔹 Photo picker placeholder
                Card(
                  color: Colors.grey[200],
                  child: ListTile(
                    leading: const Icon(Icons.camera_alt, color: Colors.blueGrey),
                    title: const Text("Tap to add photo"),
                    onTap: () {
                      // TODO: Add image picker logic
                    },
                  ),
                ),
                const SizedBox(height: 14),

                // 🔹 Location picker placeholder
                Card(
                  color: Colors.grey[200],
                  child: ListTile(
                    leading: const Icon(Icons.location_on, color: Colors.redAccent),
                    title: const Text("Auto-locate issue"),
                    trailing: const Icon(Icons.check_circle, color: Colors.green),
                    onTap: () {
                      // TODO: Add geolocation logic
                    },
                  ),
                ),
                const SizedBox(height: 18),

                // 🔹 Description input
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    hintText: 'Describe the issue...',
                    labelText: 'Description',
                    border: OutlineInputBorder(),
                  ),
                  validator: (val) =>
                  (val == null || val.isEmpty) ? 'Enter description' : null,
                  maxLines: 4,
                ),
                const SizedBox(height: 22),

                // 🔹 Submit button
                ElevatedButton.icon(
                  icon: _isSubmitting
                      ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                  )
                      : const Icon(Icons.send),
                  label: Text(_isSubmitting ? "Submitting..." : "Submit Report"),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 44),
                  ),
                  onPressed: _isSubmitting ? null : _submitReport,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}