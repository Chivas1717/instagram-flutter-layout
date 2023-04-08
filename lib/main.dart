import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_instagram_layout/blocs/posts/posts_bloc_bloc.dart';
import 'package:flutter_instagram_layout/providers/theme_settings.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'providers/story_settings.dart';
import 'my_home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SharedPreferences.setMockInitialValues({});
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  final isThemeDark = sharedPreferences.getBool('is_dark') ?? true;

  runApp(MyApp(isThemeDark: isThemeDark));
}

class MyApp extends StatelessWidget {
  final bool isThemeDark;
  const MyApp({super.key, required this.isThemeDark});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => StoryModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => ThemeSettings(isThemeDark),
        )
      ],
      builder: (context, child) {
        return BlocProvider(
          create: (context) => PostsBloc(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: Provider.of<ThemeSettings>(context).selectedTheme,
            // darkTheme: ThemeData(primarySwatch: Colors.grey),
            home: const MyHomePage(title: 'Flutter Demo Home Page'),
          ),
        );
      },
    );
  }
}
