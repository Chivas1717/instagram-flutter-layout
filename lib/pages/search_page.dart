import 'package:flutter/material.dart';
import 'package:flutter_instagram_layout/components/recomendations_block.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final items = const <List>[
    [
      Item(
          urlImage: 'Kirkjufell-volcano.png',
          userName: 'markguddest',
          likes: 7),
      Item(urlImage: 'Piramids.png', userName: 'Olegprosto', likes: 7),
      Item(urlImage: 'Niagara-falls.png', userName: 'therock', likes: 7),
    ],
    [
      Item(
          urlImage: 'Kirkjufell-volcano.png',
          userName: 'markguddestt',
          likes: 7),
      Item(urlImage: 'Piramids.png', userName: 'Olegprostoo', likes: 7),
      Item(urlImage: 'Niagara-falls.png', userName: 'therockk', likes: 7),
    ],
    [
      Item(
          urlImage: 'Kirkjufell-volcano.png',
          userName: 'markguddesttt',
          likes: 7),
      Item(urlImage: 'Piramids.png', userName: 'Olegprostooo', likes: 7),
      Item(urlImage: 'Niagara-falls.png', userName: 'therockkk', likes: 7),
    ],
    [
      Item(
          urlImage: 'Kirkjufell-volcano.png',
          userName: 'markguddestttt',
          likes: 7),
      Item(urlImage: 'Piramids.png', userName: 'Olegprostoooo', likes: 7),
      Item(urlImage: 'Niagara-falls.png', userName: 'therockkkk', likes: 7),
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Container(
          height: 30,
          decoration: const BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: const TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: 0),
              hintText: 'Пошук',
              border: InputBorder.none,
              prefix: Icon(Icons.search),
              isDense: true,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/imgs/mark_avatar.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return RecomendationsBlock(i: index, posts: items[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Item {
  final String urlImage;
  final String userName;
  final int likes;

  const Item(
      {required this.urlImage, required this.userName, required this.likes});
}
