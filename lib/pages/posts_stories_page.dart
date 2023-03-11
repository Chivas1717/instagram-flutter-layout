import 'package:flutter/cupertino.dart';

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
    return Container(
      child: Column(
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
