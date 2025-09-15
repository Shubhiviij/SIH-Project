import 'package:flutter/material.dart';

class AttachmentGalleryPage extends StatelessWidget {
  final int? reportId;
  const AttachmentGalleryPage({Key? key, this.reportId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> attachments = [
      {'thumb': Icons.image, 'label': 'Location Photo', 'desc': 'Reported Sep 8'},
      {'thumb': Icons.insert_photo, 'label': 'After Fix', 'desc': 'Resolved Sep 13'},
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Attachment Gallery: ${reportId ?? ""}')),
      body: GridView.builder(
        padding: const EdgeInsets.all(18),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: attachments.length,
        itemBuilder: (ctx, i) => Card(
          child: InkWell(
            onTap: () {
              // Replace with image viewing logic as needed
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(attachments[i]['thumb'] as IconData, size: 60, color: Colors.blueGrey),
                SizedBox(height: 8),
                Text(attachments[i]['label']?.toString() ?? '', style: TextStyle(fontWeight: FontWeight.bold)),
                Text(attachments[i]['desc']?.toString() ?? '', style: TextStyle(color: Colors.black54, fontSize: 12)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
