import 'package:flutter/material.dart';
import 'package:flutter_instagram_layout/pages/search_page.dart';

import '../components/post.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key, required this.item});

  final Item item;

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(30),
              onTap: () => Navigator.of(context).pop(),
              child: Ink(
                child: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        title: const Text(
          'Explore',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF000000),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        shape: const Border(
          bottom: BorderSide(
            color: Color.fromARGB(255, 201, 199, 195),
            width: 0.4,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Post(
            item: widget.item,
            isHero: true,
            updateSaved: () {},
          )
        ],
      ),
    );
  }
}
