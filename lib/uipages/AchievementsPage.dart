
import 'package:flutter/material.dart';

class AchievementsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Explicit type for list items and safe null handling
    final List<Map<String, dynamic>> achievements = [
      {'icon': Icons.emoji_events, 'label': 'Top Reporter', 'desc': '10+ issues submitted'},
      {'icon': Icons.star, 'label': 'Impact Maker', 'desc': '5 issues resolved'},
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Achievements & Impact')),
      body: ListView.builder(
        padding: const EdgeInsets.all(18),
        itemCount: achievements.length,
        itemBuilder: (ctx, i) => Card(
          elevation: 2,
          child: ListTile(
            leading: Icon(achievements[i]['icon'] as IconData, color: Colors.amber, size: 36),
            title: Text(achievements[i]['label']?.toString() ?? ''),
            subtitle: Text(achievements[i]['desc']?.toString() ?? ''),
          ),
        ),
      ),
    );
  }
}
