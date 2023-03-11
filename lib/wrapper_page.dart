import 'package:flutter/material.dart';
import 'package:flutter_instagram_layout/pages/create_page.dart';
import 'package:flutter_instagram_layout/pages/notifications_page.dart';
import 'package:flutter_instagram_layout/pages/posts_stories_page.dart';
import 'package:flutter_instagram_layout/pages/profile_page.dart';
import 'package:flutter_instagram_layout/pages/reels_page.dart';
import 'package:flutter_instagram_layout/pages/search_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key, required this.title});

  final String title;

  @override
  State<PostPage> createState() => _PostPage();
}

class _PostPage extends State<PostPage> {
  int _selectedIndex = 0;

  void _onClickTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _widgetOptions = <Widget>[
    PostsStories(),
    Search(),
    Create(),
    Reels(),
    Profile(),
    Notifications(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey.shade700,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon:
                  Icon(_selectedIndex == 0 ? Icons.home : Icons.home_outlined),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: _selectedIndex == 1
                  ? const Icon(
                      Icons.search,
                      color: Colors.black,
                    )
                  : const Icon(Icons.search),
              label: "search",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                _selectedIndex == 2 ? Icons.add_box : Icons.add_box_outlined,
              ),
              label: "add",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                _selectedIndex == 3 ? Icons.movie : Icons.movie_outlined,
              ),
              label: "reels",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                _selectedIndex == 4
                    ? Icons.account_circle
                    : Icons.account_circle_outlined,
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

// Icon(
//                     Icons.add_box_outlined,
//                     color: Colors.black,
//                     size: 30,
//                   ),
