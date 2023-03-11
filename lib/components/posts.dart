import 'package:flutter/material.dart';
import 'package:flutter_instagram_layout/components/post.dart';

class Posts extends StatefulWidget {
  const Posts({super.key});

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(top: 10.0),
      decoration: const BoxDecoration(
        border: Border(
          top:
              BorderSide(color: Color.fromARGB(255, 201, 199, 195), width: 0.4),
        ),
        color: Colors.white,
      ),
      child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return const Post();
          }),
    );
  }
}
// Stories(),