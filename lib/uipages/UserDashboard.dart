import 'package:flutter/material.dart';

// User dashboard: Entry/home for citizens, fast actions, stats
class UserDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Dashboard'),
        actions: [
          IconButton(icon: Icon(Icons.notifications), onPressed: () {
            Navigator.pushNamed(context, '/notifications');
          }),
          IconButton(icon: Icon(Icons.settings), onPressed: () {
            Navigator.pushNamed(context, '/profile_settings');
          }),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Welcome Back!", style: Theme.of(context).textTheme.headlineSmall),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Card(
                    color: Colors.lightBlueAccent,
                    child: InkWell(
                      onTap: () => Navigator.pushNamed(context, '/submit_report'),
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          children: [
                            Icon(Icons.add_location_alt, color: Colors.white, size: 32),
                            SizedBox(height: 8),
                            Text('Submit Report', style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 14),
                Expanded(
                  child: Card(
                    color: Colors.indigoAccent,
                    child: InkWell(
                      onTap: () => Navigator.pushNamed(context, '/my_reports'),
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          children: [
                            Icon(Icons.timeline, color: Colors.white, size: 32),
                            SizedBox(height: 8),
                            Text('My Reports', style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            // Example: recent activity preview
            Text("Recent Activity", style: Theme.of(context).textTheme.titleMedium),
            SizedBox(height: 12),
            ListTile(
              leading: Icon(Icons.check_circle, color: Colors.green),
              title: Text("Pothole issue on 3rd Street resolved"),
              subtitle: Text("2 hrs ago"),
            ),
            // This area can be extended to dynamically list updates/notifications
          ],
        ),
      ),
    );
  }
}
