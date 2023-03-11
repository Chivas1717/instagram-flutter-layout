import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/posts.dart';
import '../components/stories.dart';

class PostsStories extends StatefulWidget {
  const PostsStories({super.key});

  @override
  State<PostsStories> createState() => _PostsStoriesState();
}

class _PostsStoriesState extends State<PostsStories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          FontAwesomeIcons.instagram,
          color: Colors.black,
          size: 33,
        ),
        actions: [
          Container(
            width: 80,
            margin: const EdgeInsets.only(right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: const Icon(Icons.favorite_border),
                  color: Colors.black,
                  iconSize: 28,
                  onPressed: () {},
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: const Icon(Icons.message),
                  color: Colors.black,
                  iconSize: 30,
                  onPressed: () {},
                )
              ],
            ),
          ),
        ],
        backgroundColor: Colors.white,
        shape: const Border(
          bottom:
              BorderSide(color: Color.fromARGB(255, 201, 199, 195), width: 0.4),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          Stories(),
          Expanded(
            child: Posts(),
          ),
        ],
      ),
    );
  }
}
