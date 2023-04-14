import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[700],
      appBar: AppBar(
        title: Text('Nested screen'),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.keyboard_arrow_left_outlined),
        ),
        backgroundColor: Colors.black,
        elevation: 15,
      ),
      body: Center(
        child: Text(
          'dwadwadawd',
          style: TextStyle(fontSize: 50, color: Colors.white),
        ),
      ),
    );
  }
}
