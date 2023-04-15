import 'package:flutter/material.dart';
import 'package:flutter_instagram_layout/components/notification_item.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key, required this.value});
  final value;

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Notifications',
          style: TextStyle(fontSize: 24),
        ),
        actions: [
          Center(
            child: Text(widget.value),
          )
        ],
        leading: IconButton(
          onPressed: () => Navigator.pop(context, 'visited notifications'),
          icon: const Icon(Icons.keyboard_arrow_left_outlined),
        ),
        backgroundColor: Colors.black,
        elevation: 15,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 10, bottom: 7, top: 7),
              child: const Text(
                'Yesterday',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            for (int i = 0; i < 2; i++)
              const SizedBox(width: 392, child: NotificationItem()),
            Container(
              padding: const EdgeInsets.only(left: 10, bottom: 7, top: 7),
              child: const Text(
                'This week',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            for (int i = 0; i < 3; i++)
              const SizedBox(width: 392, child: NotificationItem()),
            Container(
              padding: const EdgeInsets.only(left: 10, bottom: 7, top: 7),
              child: const Text(
                'Earlier',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            for (int i = 0; i < 5; i++)
              const SizedBox(
                width: 392,
                child: NotificationItem(),
              ),
          ],
        ),
      ),
    );
  }
}
