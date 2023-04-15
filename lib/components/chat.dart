import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

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
            width: 64,
            height: 64,
            padding: const EdgeInsets.all(3),
            child: const CircleAvatar(
              radius: 32,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage(
                'assets/imgs/mark_avatar.png',
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'markguddest',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                'Seen today',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              )
            ],
          ),
          Expanded(child: Container()),
          const Icon(
            Icons.camera_alt_outlined,
            color: Colors.grey,
            size: 28,
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
    );
  }
}
