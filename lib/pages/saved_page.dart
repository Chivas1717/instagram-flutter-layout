import 'package:flutter/material.dart';
import 'package:flutter_instagram_layout/pages/search_page.dart';

import '../components/post.dart';

class Saved extends StatelessWidget {
  const Saved({
    super.key,
    required this.savedItems,
    required this.updateSaved,
  });

  final List<Item> savedItems;
  final Function updateSaved;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: savedItems.isEmpty
            ? const Center(
                child: Text('No saved posts found'),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  for (int i = 0; i < savedItems.length; i++)
                    SizedBox(
                      width: 392,
                      child: Post(
                        item: savedItems[i],
                        isHero: false,
                        updateSaved: updateSaved,
                      ),
                    ),
                ],
              ),
      ),
    );
  }
}
