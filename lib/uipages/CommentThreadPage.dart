
import 'package:flutter/material.dart';

// Each report can have an interactive comment/message thread for citizen/admin.

class CommentThreadPage extends StatefulWidget {
  final int? reportId;
  const CommentThreadPage({Key? key, this.reportId}) : super(key: key);

  @override
  State<CommentThreadPage> createState() => _CommentThreadPageState();
}

class _CommentThreadPageState extends State<CommentThreadPage> {
  final TextEditingController _msgCtrl = TextEditingController();

  final List<Map<String, String>> messages = [
    {'by': 'Admin', 'msg': 'Thank you for reporting. We are assigning staff.'},
    {'by': 'You', 'msg': 'Please update after it is cleaned.'},
  ];

  void sendMessage() {
    if (_msgCtrl.text.trim().isNotEmpty) {
      setState(() {
        messages.add({'by': 'You', 'msg': _msgCtrl.text.trim()});
        _msgCtrl.clear();
      });
      // Hook: send to backend
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Comments/Thread: ${widget.reportId ?? ''}")),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: messages
                  .map((m) => Align(
                alignment: m['by'] == 'You' ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  decoration: BoxDecoration(
                    color: m['by'] == 'You'
                        ? Colors.lightBlueAccent.withOpacity(0.2)
                        : Colors.grey[200],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text('${m['by']}: ${m['msg']}'),
                ),
              ))
                  .toList(),
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _msgCtrl,
                    decoration: InputDecoration(
                      hintText: "Type your message…",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: sendMessage,
                  color: Theme.of(context).primaryColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
