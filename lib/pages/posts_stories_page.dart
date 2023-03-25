import 'package:flutter/material.dart';
import 'package:flutter_instagram_layout/components/post.dart';
import 'package:flutter_instagram_layout/pages/search_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/stories.dart';

class PostsStories extends StatefulWidget {
  const PostsStories({super.key, required this.updateSaved});

  final Function updateSaved;

  @override
  State<PostsStories> createState() => _PostsStoriesState();
}

class _PostsStoriesState extends State<PostsStories> {
  ScrollController scrollController = ScrollController();
  bool showbtn = false;

  final items = <Item>[
    Item(
      id: 1,
      urlImage: 'Kirkjufell-volcano.png',
      userName: 'markguddest',
      likes: 7,
      isSaved: false,
    ),
    Item(
      id: 1,
      urlImage: 'Piramids.png',
      userName: 'Olegprosto',
      likes: 7,
      isSaved: false,
    ),
    Item(
      id: 1,
      urlImage: 'Niagara-falls.png',
      userName: 'therock',
      likes: 7,
      isSaved: false,
    ),
    Item(
      id: 1,
      urlImage: 'Kirkjufell-volcano.png',
      userName: 'markguddest',
      likes: 7,
      isSaved: false,
    ),
    Item(
      id: 1,
      urlImage: 'Piramids.png',
      userName: 'Olegprosto',
      likes: 7,
      isSaved: false,
    ),
    Item(
      id: 1,
      urlImage: 'Niagara-falls.png',
      userName: 'therock',
      likes: 7,
      isSaved: false,
    ),
    Item(
      id: 1,
      urlImage: 'Kirkjufell-volcano.png',
      userName: 'markguddest',
      likes: 7,
      isSaved: false,
    ),
    Item(
      id: 1,
      urlImage: 'Piramids.png',
      userName: 'Olegprosto',
      likes: 7,
      isSaved: false,
    ),
  ];

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
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          FontAwesomeIcons.instagram,
          color: Colors.black,
          size: 33,
        ),
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
                  color: Colors.black,
                  iconSize: 28,
                  onPressed: () {},
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: const Icon(Icons.message),
                  color: Colors.black,
                  iconSize: 30,
                  onPressed: () {},
                )
              ],
            ),
          ),
        ],
        backgroundColor: Colors.white,
        shape: const Border(
          bottom: BorderSide(
            color: Color.fromARGB(255, 201, 199, 195),
            width: 0.4,
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Stories(),
            for (int i = 0; i < 8; i++)
              SizedBox(
                width: 392,
                child: Post(
                  item: items[i],
                  isHero: false,
                  updateSaved: widget.updateSaved,
                ),
              ),
          ],
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
