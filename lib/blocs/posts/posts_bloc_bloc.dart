import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_instagram_layout/blocs/posts/posts_bloc_event.dart';
import 'package:flutter_instagram_layout/blocs/posts/posts_bloc_state.dart';

class PostsBloc extends Bloc<PostsBlocEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
    on<AddPostEvent>(_onAddPost);
    on<UpdateSavedPostsEvent>(_updateSavedPostsEvent);
  }

  void _onAddPost(AddPostEvent event, Emitter<PostsState> emit) {
    final state = this.state;

    emit(PostsResultState([...state.posts, event.post], state.savedPosts));
  }

  void _updateSavedPostsEvent(
      UpdateSavedPostsEvent event, Emitter<PostsState> emit) {
    final state = this.state;

    if (state.savedPosts.contains(event.post)) {
      emit(
        PostsResultState(
          state.posts,
          state.savedPosts.where((e) => e.id != event.post.id).toList(),
        ),
      );
    } else {
      emit(PostsResultState(state.posts, [...state.savedPosts, event.post]));
    }
  }
}
