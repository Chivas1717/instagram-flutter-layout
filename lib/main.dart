import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_instagram_layout/bloc/posts_bloc_bloc.dart';
import 'package:provider/provider.dart';

import 'models/story_model.dart';
import 'my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => StoryModel(),
        child: BlocProvider(
          create: (context) => PostsBloc(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
                primarySwatch: Colors.blue,
                appBarTheme: const AppBarTheme(
                  elevation: 0,
                )),
            home: const MyHomePage(title: 'Flutter Demo Home Page'),
          ),
        ));
  }
}
