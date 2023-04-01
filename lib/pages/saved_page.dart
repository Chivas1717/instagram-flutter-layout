import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_instagram_layout/bloc/posts_bloc_bloc.dart';
import 'package:flutter_instagram_layout/bloc/posts_bloc_state.dart';

import '../components/post.dart';

class Saved extends StatelessWidget {
  const Saved({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostsBloc, PostsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            iconTheme: const IconThemeData(color: Colors.black),
          ),
          body: SingleChildScrollView(
            child: state.savedPosts.isEmpty
                ? const Center(
                    child: Text('No saved posts found'),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      for (int i = 0; i < state.savedPosts.length; i++)
                        SizedBox(
                          width: 392,
                          child: Post(
                            item: state.savedPosts[i],
                            isHero: false,
                          ),
                        ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
