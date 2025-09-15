import 'package:flutter/material.dart';

// Admin landing page: high-level stats, fast navigation, visual summaries
class AdminDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => Navigator.pushNamed(context, '/admin_settings'),
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(18),
        children: [
          _buildNavTile(context, Icons.report, 'Manage Reports', '/manage_reports'),
          _buildNavTile(context, Icons.map, 'Live Map View', '/live_map_view'),
          _buildNavTile(context, Icons.analytics, 'Analytics & Reports', '/analytics_reports'),
          _buildNavTile(context, Icons.apartment, 'Dept. Performance', '/department_performance'),
          _buildNavTile(context, Icons.dashboard_customize, 'System Overview/KPIs', '/system_overview'),
          _buildNavTile(context, Icons.group, 'Staff Management', '/staff_management'),
          _buildNavTile(context, Icons.person, 'User Management', '/user_management'),
          _buildNavTile(context, Icons.rule_folder, 'Audit Logs', '/audit_logs'),
          _buildNavTile(context, Icons.update, 'App Updates', '/app_updates'),
        ],
      ),
    );
  }

  // Helper for modular navigation tile construction
  Widget _buildNavTile(BuildContext ctx, IconData icon, String label, String route) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(8),
      child: InkWell(
        onTap: () => Navigator.pushNamed(ctx, route),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 38, color: Colors.blueAccent),
              SizedBox(height: 9),
              Text(label, style: TextStyle(fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ),
    );
  }
}
