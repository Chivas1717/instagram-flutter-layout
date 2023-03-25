import 'package:flutter/material.dart';
import 'package:flutter_instagram_layout/components/drawer_item.dart';
import 'package:flutter_instagram_layout/components/profile_info.dart';
import 'package:flutter_instagram_layout/pages/saved_page.dart';
import 'package:flutter_instagram_layout/pages/search_page.dart';

import '../components/profile_posts.dart';

class Profile extends StatefulWidget {
  const Profile(
      {super.key, required this.updateSaved, required this.savedItems});

  final Function updateSaved;
  final List<Item> savedItems;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        shape: const Border(
          bottom: BorderSide(
            color: Color.fromARGB(255, 201, 199, 195),
            width: 0.4,
          ),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      endDrawer: Drawer(
        child: Container(
          padding: const EdgeInsets.only(top: 60),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerItem(
                icon: Icon(Icons.settings),
                title: 'Settings',
              ),
              const DrawerItem(
                icon: Icon(Icons.watch_later_outlined),
                title: 'Scheduled content',
              ),
              const DrawerItem(
                icon: Icon(Icons.settings_backup_restore_rounded),
                title: 'Archive',
              ),
              const DrawerItem(
                icon: Icon(Icons.insights_outlined),
                title: 'Insights',
              ),
              const DrawerItem(
                icon: Icon(Icons.qr_code_rounded),
                title: 'QR code',
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Saved(
                          savedItems: widget.savedItems,
                          updateSaved: widget.updateSaved,
                        );
                      },
                    ),
                  );
                },
                child: const DrawerItem(
                  icon: Icon(Icons.bookmark_border),
                  title: 'Saved',
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileInfo(),
            ProfilePosts(),
          ],
        ),
      ),
    );
  }
}
