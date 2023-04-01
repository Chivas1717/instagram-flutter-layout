import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_instagram_layout/bloc/posts_bloc_bloc.dart';
import 'package:flutter_instagram_layout/bloc/posts_bloc_state.dart';
import 'package:flutter_instagram_layout/components/post.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/stories.dart';
import '../models/post_model.dart';

class PostsStories extends StatefulWidget {
  const PostsStories({super.key});

  @override
  State<PostsStories> createState() => _PostsStoriesState();
}

class _PostsStoriesState extends State<PostsStories> {
  ScrollController scrollController = ScrollController();
  bool showbtn = false;

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.offset > 10) {
        setState(() {
          showbtn = true;
        });
      } else {
        setState(() {
          showbtn = false;
        });
      }
    });
    super.initState();
  }

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
          bottom: BorderSide(
            color: Color.fromARGB(255, 201, 199, 195),
            width: 0.4,
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: BlocBuilder<PostsBloc, PostsState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stories(),
                for (int i = 0; i < state.posts.length; i++)
                  SizedBox(
                    width: 392,
                    child: Post(
                      item: state.posts[i],
                      isHero: false,
                    ),
                  ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: AnimatedOpacity(
        duration: const Duration(milliseconds: 400),
        opacity: showbtn ? 1.0 : 0.0,
        child: FloatingActionButton(
          onPressed: () {
            scrollController.animateTo(
              0,
              duration: const Duration(milliseconds: 500),
              curve: Curves.fastOutSlowIn,
            );
          },
          backgroundColor: Colors.blue,
          splashColor: Colors.amber,
          child: const Icon(Icons.arrow_upward_outlined),
        ),
      ),
    );
  }
}
