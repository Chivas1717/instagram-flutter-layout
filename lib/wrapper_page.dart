import 'package:flutter/material.dart';
import 'package:flutter_instagram_layout/pages/create_page.dart';
import 'package:flutter_instagram_layout/pages/posts_stories_page.dart';
import 'package:flutter_instagram_layout/pages/profile_page.dart';
import 'package:flutter_instagram_layout/pages/reels_page.dart';
import 'package:flutter_instagram_layout/pages/search_page.dart';

import 'models/post_model.dart';

class WrapperPage extends StatefulWidget {
  const WrapperPage({super.key, required this.title});

  final String title;

  @override
  State<WrapperPage> createState() => _WrapperPage();
}

class _WrapperPage extends State<WrapperPage>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  int _selectedIndex = 0;
  late TabController _controller;
  // List<Item> savedItems = <Item>[];

  // void _updateSaved(bool isSaved, Item item) {
  //   setState(() {
  //     if (isSaved) {
  //       savedItems.add(item);
  //     } else {
  //       savedItems.remove(item);
  //     }
  //   });
  // }

  @override
  // ignore: must_call_super
  void initState() {
    super.initState();
    _controller = TabController(length: _widgetOptions().length, vsync: this);
    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  void _onClickTab(int index) {
    setState(() {
      _selectedIndex = index;
      _controller.animateTo(index);
    });
  }

  List<Widget> _widgetOptions() => [
        PostsStories(),
        Search(),
        CreateScreen(),
        const Reels(),
        Profile(),
      ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetOptions = _widgetOptions();
    return SizedBox(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: TabBarView(
          controller: _controller,
          children: widgetOptions,
        ),
        // _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey.shade700,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
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
