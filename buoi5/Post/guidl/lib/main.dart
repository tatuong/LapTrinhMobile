import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MaterialApp(home: PostForm()));

class PostForm extends StatefulWidget {
  @override
  _PostFormState createState() => _PostFormState();
}

class _PostFormState extends State<PostForm> {
  final titleCtrl = TextEditingController();
  final bodyCtrl = TextEditingController();

  Future<void> sendPost() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "title": titleCtrl.text,
        "body": bodyCtrl.text,
        "userId": 1,
      }),
    );

    print("STATUS: ${response.statusCode}");
    print("RESPONSE: ${response.body}");

    if (response.statusCode == 201) {
      showDialog(
        context: context,
        builder:
            (_) => AlertDialog(
              content: Text("Gửi thành công!\n\n${response.body}"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("OK"),
                ),
              ],
            ),
      );
      titleCtrl.clear();
      bodyCtrl.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Gửi bài viết")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: titleCtrl,
              decoration: InputDecoration(labelText: "Tiêu đề"),
            ),
            TextField(
              controller: bodyCtrl,
              decoration: InputDecoration(labelText: "Nội dung"),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: sendPost, child: Text("Gửi")),
          ],
        ),
      ),
    );
  }
}
