import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_instagram_layout/blocs/posts/posts_bloc_bloc.dart';
import 'package:flutter_instagram_layout/blocs/posts/posts_bloc_state.dart';
import 'package:flutter_instagram_layout/components/post.dart';
import 'package:flutter_instagram_layout/pages/chats_page.dart';
import 'package:flutter_instagram_layout/pages/notifications_page.dart';
import 'package:flutter_instagram_layout/providers/theme_settings.dart';
import 'package:flutter_instagram_layout/utils/routs.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../components/stories.dart';
import '../utils/navigator_keys.dart';

class PostsStories extends StatefulWidget {
  const PostsStories({
    super.key,
    required this.navigatorKey,
  });

  final GlobalKey<NavigatorState> navigatorKey;

  @override
  State<PostsStories> createState() => _PostsStoriesState();
}

class _PostsStoriesState extends State<PostsStories> {
  ScrollController scrollController = ScrollController();
  bool showbtn = false;

  void _push(BuildContext context, String name) {
    BuildContext _desiredContext;

    if (name == 'Notifications') {
      _desiredContext = widget.navigatorKey.currentContext!;
    } else {
      _desiredContext = NavigatorKeys.navigatorKeyMain.currentContext!;
    }
    Navigator.of(_desiredContext).push(
      MaterialPageRoute(builder: (context) {
        var returnWidget;
        if (name == 'Notifications') {
          returnWidget = Notifications();
        } else {
          returnWidget = Chats();
        }
        return returnWidget;
      }),
    );
  }

  void _switchTheme() {
    final settings = Provider.of<ThemeSettings>(context, listen: false);
    settings.switchTheme();
  }

  Map<String, WidgetBuilder> _routeBuilders(
    BuildContext context,
  ) {
    return {
      '/': (context) => _home(context),
      '/notifications': (context) => Notifications(),
    };
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
    var routeBuilders = _routeBuilders(context);

    return Scaffold(
      body: Navigator(
        key: widget.navigatorKey,
        initialRoute: NestedScreenRoutes.root,
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) => routeBuilders[settings.name]!(context),
          );
        },
      ),
    );
  }

  Widget _home(BuildContext context) {
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
        title: Text('wadawda'),
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
                  onPressed: () async {
                    final result = await Navigator.pushNamed(
                      context,
                      '/notifications',
                    ) as String;
                    if (!mounted) return;

                    ScaffoldMessenger.of(context)
                      ..removeCurrentSnackBar()
                      ..showSnackBar(
                        SnackBar(
                          duration: const Duration(seconds: 1),
                          content: Text(
                            result,
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      );
                  },
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: const Icon(Icons.message),
                  color: themeDark ? Colors.white : Colors.black,
                  iconSize: 30,
                  onPressed: () => _push(context, 'Messages'),
                ),
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
