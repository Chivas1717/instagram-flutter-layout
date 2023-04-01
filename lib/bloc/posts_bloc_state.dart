import 'package:flutter/material.dart';

import '../models/post_model.dart';

@immutable
abstract class PostsState {
  final List<Item> posts, savedPosts;

  const PostsState(this.posts, this.savedPosts);
}

class PostsInitial extends PostsState {
  PostsInitial()
      : super(
          [
            Item(
              id: 1,
              urlImage: 'Kirkjufell-volcano.png',
              userName: 'markguddest',
              likes: 7,
              isSaved: false,
            ),
            Item(
              id: 1,
              urlImage: 'Piramids.png',
              userName: 'Olegprosto',
              likes: 7,
              isSaved: false,
            ),
            Item(
              id: 1,
              urlImage: 'Niagara-falls.png',
              userName: 'therock',
              likes: 7,
              isSaved: false,
            ),
            Item(
              id: 1,
              urlImage: 'Kirkjufell-volcano.png',
              userName: 'markguddest',
              likes: 7,
              isSaved: false,
            ),
            Item(
              id: 1,
              urlImage: 'Piramids.png',
              userName: 'Olegprosto',
              likes: 7,
              isSaved: false,
            ),
            Item(
              id: 1,
              urlImage: 'Niagara-falls.png',
              userName: 'therock',
              likes: 7,
              isSaved: false,
            ),
            Item(
              id: 1,
              urlImage: 'Kirkjufell-volcano.png',
              userName: 'markguddest',
              likes: 7,
              isSaved: false,
            ),
            Item(
              id: 1,
              urlImage: 'Piramids.png',
              userName: 'Olegprosto',
              likes: 7,
              isSaved: false,
            ),
          ],
          [],
        );
}

class PostsResultState extends PostsState {
  const PostsResultState(super.posts, super.savedPosts);
}
