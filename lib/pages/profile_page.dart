import 'package:flutter/material.dart';
import 'package:flutter_instagram_layout/components/drawer_item.dart';
import 'package:flutter_instagram_layout/components/profile_info.dart';
import 'package:flutter_instagram_layout/pages/saved_page.dart';
import 'package:flutter_instagram_layout/providers/theme_settings.dart';
import 'package:provider/provider.dart';

import '../components/profile_posts.dart';
import 'crypto_market_page.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    bool themeDark =
        Provider.of<ThemeSettings>(context, listen: true).selectedTheme ==
            ThemeData.dark();

    return Scaffold(
      appBar: AppBar(
        leading: Center(
          child: Text(
            'markguddest',
            style: TextStyle(
                color: themeDark ? Colors.white : Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
        leadingWidth: 150,
        iconTheme:
            IconThemeData(color: themeDark ? Colors.white : Colors.black),
        shape: const Border(
          bottom: BorderSide(
            color: Color.fromARGB(255, 201, 199, 195),
            width: 0.4,
          ),
        ),
        backgroundColor: themeDark ? Colors.grey[860] : Colors.white,
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
                        return const Saved();
                      },
                    ),
                  );
                },
                child: const DrawerItem(
                  icon: Icon(Icons.bookmark_border),
                  title: 'Saved',
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const CryptoMarket();
                      },
                    ),
                  );
                },
                child: const DrawerItem(
                  icon: Icon(Icons.currency_bitcoin),
                  title: 'CryptoMarket',
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ProfileInfo(),
            ProfilePosts(),
          ],
        ),
      ),
    );
  }
}
