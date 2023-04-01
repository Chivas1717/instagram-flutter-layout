import 'package:flutter/material.dart';
import 'package:flutter_instagram_layout/components/post.dart';

import '../models/post_model.dart';

class Posts extends StatefulWidget {
  const Posts({super.key});

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
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
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(top: 10.0),
      decoration: const BoxDecoration(
        border: Border(
          top:
              BorderSide(color: Color.fromARGB(255, 201, 199, 195), width: 0.4),
        ),
        color: Colors.white,
      ),
      child: ListView.builder(
        itemCount: 12,
        itemBuilder: (context, index) {
          final item = items[index];
          return Post(
            item: item,
            isHero: false,
          );
        },
      ),
    );
  }
}
// Stories(),