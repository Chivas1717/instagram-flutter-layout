import 'package:flutter/material.dart';

import '../../models/post_model.dart';

@immutable
abstract class PostsBlocEvent {}

class AddPostEvent extends PostsBlocEvent {
  final Item post;

  AddPostEvent({
    required this.post,
  });
}

class UpdateSavedPostsEvent extends PostsBlocEvent {
  final Item post;

  UpdateSavedPostsEvent({
    required this.post,
  });
}
