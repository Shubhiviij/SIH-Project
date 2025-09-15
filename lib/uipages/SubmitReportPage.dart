import 'package:flutter/material.dart';

// Citizen report submission page: upload photo, get location, add details

class SubmitReportPage extends StatefulWidget {
  const SubmitReportPage({super.key});

  @override
  State<SubmitReportPage> createState() => _SubmitReportPageState();
}

class _SubmitReportPageState extends State<SubmitReportPage> {
  final _formKey = GlobalKey<FormState>();
  String _description = '';

  // Integrate with image/location pickers and backend as needed

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Report an Issue')),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Photo picker placeholder (replace with image picker logic)
                Card(
                  color: Colors.grey[200],
                  child: ListTile(
                    leading: Icon(Icons.camera_alt, color: Colors.blueGrey),
                    title: Text("Tap to add photo"),
                    onTap: () {
                      // Integrate: image picker plugin
                    },
                  ),
                ),
                SizedBox(height: 14),
                // Location picker placeholder (replace with geolocation logic)
                Card(
                  color: Colors.grey[200],
                  child: ListTile(
                    leading: Icon(Icons.location_on, color: Colors.redAccent),
                    title: Text("Auto-locate issue"),
                    trailing: Icon(Icons.check_circle, color: Colors.green),
                    onTap: () {
                      // Integrate: location plugin
                    },
                  ),
                ),
                SizedBox(height: 18),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Describe the issue...',
                    labelText: 'Description',
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (val) => _description = val ?? '',
                  validator: (val) =>
                  (val == null || val.isEmpty) ? 'Enter description' : null,
                  maxLines: 4,
                ),
                SizedBox(height: 22),
                ElevatedButton.icon(
                  icon: Icon(Icons.send),
                  label: Text('Submit Report'),
                  style:
                  ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 44)),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // Integrate: submit report logic
                      Navigator.pop(context); // Optionally show a dialog/snackbar
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
