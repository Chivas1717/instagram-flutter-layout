import 'package:flutter/material.dart';

class Chats extends StatelessWidget {
  const Chats({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[700],
      appBar: AppBar(
        title: Text('Chats'),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.keyboard_arrow_left_outlined),
        ),
        backgroundColor: Colors.black,
        elevation: 15,
      ),
      body: Center(
        child: Text(
          'Chats will be displayed here',
          style: TextStyle(fontSize: 50, color: Colors.white),
        ),
      ),
    );
  }
}
