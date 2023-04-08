import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_instagram_layout/blocs/posts/posts_bloc_bloc.dart';
import 'package:flutter_instagram_layout/blocs/posts/posts_bloc_state.dart';
import 'package:flutter_instagram_layout/components/post.dart';
import 'package:flutter_instagram_layout/providers/theme_settings.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../components/stories.dart';

class PostsStories extends StatefulWidget {
  const PostsStories({super.key});

  @override
  State<PostsStories> createState() => _PostsStoriesState();
}

class _PostsStoriesState extends State<PostsStories> {
  ScrollController scrollController = ScrollController();
  bool showbtn = false;

  void _switchTheme() {
    final settings = Provider.of<ThemeSettings>(context, listen: false);
    settings.switchTheme();
  }

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
    bool themeDark =
        Provider.of<ThemeSettings>(context, listen: true).selectedTheme ==
            ThemeData.dark();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(FontAwesomeIcons.instagram),
          color: themeDark ? Colors.white : Colors.black,
          iconSize: 33,
          onPressed: _switchTheme,
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
                  color: themeDark ? Colors.white : Colors.black,
                  iconSize: 28,
                  onPressed: () {},
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: const Icon(Icons.message),
                  color: themeDark ? Colors.white : Colors.black,
                  iconSize: 30,
                  onPressed: () {},
                )
              ],
            ),
          ),
        ],
        backgroundColor: themeDark ? Colors.grey[860] : Colors.white,
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
                const Stories(),
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
