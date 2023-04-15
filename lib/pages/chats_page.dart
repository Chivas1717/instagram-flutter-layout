import 'package:flutter/material.dart';

import '../components/chat.dart';

class Chats extends StatelessWidget {
  const Chats({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'markguddest',
          style: TextStyle(fontSize: 24),
        ),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.keyboard_arrow_left_outlined),
        ),
        actions: const [
          Icon(Icons.more_horiz),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.edit),
          SizedBox(
            width: 10,
          ),
        ],
        backgroundColor: Colors.black,
        elevation: 15,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            for (int i = 0; i < 10; i++)
              const SizedBox(width: 392, child: Chat()),
          ],
        ),
      ),
    );
  }
}
