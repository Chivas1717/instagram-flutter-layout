import 'package:flutter/material.dart';
import 'package:flutter_instagram_layout/components/home/button_follow.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 7, bottom: 7),
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          Container(
            width: 50,
            height: 50,
            padding: const EdgeInsets.all(3),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(colors: [
                Color(0xFFfeda75),
                Color(0xFFfa7e1e),
                Color(0xFFd62976),
                Color(0xFF962fbf),
                Color(0xFF4f5bd5),
              ], begin: Alignment.bottomLeft, end: Alignment.topRight),
            ),
            child: const CircleAvatar(
              backgroundColor: Colors.white,
              radius: 25,
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage(
                  'assets/imgs/mark_avatar.png',
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Flexible(
              child: RichText(
            text: TextSpan(
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.white,
              ),
              children: <TextSpan>[
                TextSpan(
                    text: 'markguddest',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: ', who you might know, is on instagram.'),
              ],
            ),
          )
              // Text('markguddest, who you might know, is on instagram.'),
              ),
          const SizedBox(
            width: 10,
          ),
          ButtonFollow(isFollowed: false),
        ],
      ),
    );
  }
}
