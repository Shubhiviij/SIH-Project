import 'package:flutter/material.dart';

// System-wide KPIs: infrastructure health, usage summary, quick stats
class SystemOverviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace demo stats with backend data as needed
    final kpis = [
      {'label': 'Active Users', 'value': '1,235'},
      {'label': 'Open Reports', 'value': '42'},
      {'label': 'Staff Online', 'value': '17'},
      {'label': 'Avg.ResolveTime', 'value': '2h 8m'},
    ];

    return Scaffold(
      appBar: AppBar(title: Text('System Overview & KPIs')),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(20),
        childAspectRatio: 1.3,
        children: kpis
            .map((kpi) => Card(
          color: Colors.blueGrey.shade50,
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(kpi['label']!, style: TextStyle(color: Colors.blueGrey, fontSize: 15)),
                SizedBox(height: 12),
                Text(kpi['value']!, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ],
            ),
          ),
        ))
            .toList(),
      ),
    );
  }
}