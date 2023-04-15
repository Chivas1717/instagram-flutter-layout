import 'package:flutter/material.dart';
import 'package:flutter_instagram_layout/pages/create_page.dart';
import 'package:flutter_instagram_layout/pages/posts_stories_page.dart';
import 'package:flutter_instagram_layout/pages/profile_page.dart';
import 'package:flutter_instagram_layout/pages/reels_page.dart';
import 'package:flutter_instagram_layout/pages/search_page.dart';
import 'package:flutter_instagram_layout/providers/theme_settings.dart';
import 'package:flutter_instagram_layout/utils/navigator_keys.dart';
import 'package:provider/provider.dart';

class WrapperPage extends StatefulWidget {
  const WrapperPage({super.key, required this.title});

  final String title;

  @override
  State<WrapperPage> createState() => _WrapperPage();
}

class _WrapperPage extends State<WrapperPage>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  int _selectedIndex = 0;
  // late TabController _controller;

  @override
  // ignore: must_call_super
  // void initState() {
  //   super.initState();
  //   _controller = TabController(length: _widgetOptions().length, vsync: this);
  //   _controller.addListener(() {
  //     setState(() {
  //       _selectedIndex = _controller.index;
  //     });
  //   });
  // }

  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }

  @override
  bool get wantKeepAlive => true;

  void _onClickTab(int index) {
    setState(() {
      _selectedIndex = index;
      // _controller.animateTo(index);
    });
  }

  List<Widget> _widgetOptions() => [
        PostsStories(navigatorKey: _navigatorKey()),
        Search(),
        const CreateScreen(),
        const Reels(),
        const Profile(),
      ];

  GlobalKey<NavigatorState> _navigatorKey() {
    switch (_selectedIndex) {
      case 0:
        return NavigatorKeys.bottomNavigationBarFirstItem;
      case 1:
        return NavigatorKeys.bottomNavigationBarSecondItem;
      case 2:
        return NavigatorKeys.bottomNavigationBarThirdItem;
      case 3:
        return NavigatorKeys.bottomNavigationBarFourthItem;
      default:
        return NavigatorKeys.bottomNavigationBarFifthItem;
    }
  }

  @override
  Widget build(BuildContext context) {
    bool themeDark =
        Provider.of<ThemeSettings>(context, listen: true).selectedTheme ==
            ThemeData.dark();
    Color iconColor = themeDark ? Colors.white : Colors.black;

    final List<Widget> widgetOptions = _widgetOptions();
    return SizedBox(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey.shade700,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                _selectedIndex == 0 ? Icons.home : Icons.home_outlined,
                color: iconColor,
              ),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: _selectedIndex == 1
                  ? Icon(
                      Icons.search,
                      color: iconColor,
                    )
                  : Icon(
                      Icons.search,
                      color: iconColor,
                    ),
              label: "search",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                _selectedIndex == 2 ? Icons.add_box : Icons.add_box_outlined,
                color: iconColor,
              ),
              label: "add",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                _selectedIndex == 3 ? Icons.movie : Icons.movie_outlined,
                color: iconColor,
              ),
              label: "reels",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                _selectedIndex == 4
                    ? Icons.account_circle
                    : Icons.account_circle_outlined,
                color: iconColor,
              ),
              label: "profile",
            ),
          ],
          iconSize: 30,
          currentIndex: _selectedIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: _onClickTab,
        ),
      ),
    );
  }
}
