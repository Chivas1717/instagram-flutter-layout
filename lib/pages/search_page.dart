import 'package:flutter/material.dart';
import 'package:flutter_instagram_layout/components/recomendations_block.dart';

class Search extends StatelessWidget {
  Search({super.key});

  final items = <List>[
    [
      Item(
        id: 1,
        urlImage: 'Kirkjufell-volcano.png',
        userName: 'markguddest',
        likes: 7,
        isSaved: false,
      ),
      Item(
        id: 2,
        urlImage: 'Piramids.png',
        userName: 'Olegprosto',
        likes: 7,
        isSaved: false,
      ),
      Item(
        id: 3,
        urlImage: 'Niagara-falls.png',
        userName: 'therock',
        likes: 7,
        isSaved: false,
      ),
    ],
    [
      Item(
        id: 4,
        urlImage: 'Kirkjufell-volcano.png',
        userName: 'markguddestt',
        likes: 7,
        isSaved: false,
      ),
      Item(
        id: 5,
        urlImage: 'Piramids.png',
        userName: 'Olegprostoo',
        likes: 7,
        isSaved: false,
      ),
      Item(
        id: 6,
        urlImage: 'Niagara-falls.png',
        userName: 'therockk',
        likes: 7,
        isSaved: false,
      ),
    ],
    [
      Item(
        id: 7,
        urlImage: 'Kirkjufell-volcano.png',
        userName: 'markguddesttt',
        likes: 7,
        isSaved: false,
      ),
      Item(
        id: 8,
        urlImage: 'Piramids.png',
        userName: 'Olegprostooo',
        likes: 7,
        isSaved: false,
      ),
      Item(
        id: 9,
        urlImage: 'Niagara-falls.png',
        userName: 'therockkk',
        likes: 7,
        isSaved: false,
      ),
    ],
    [
      Item(
        id: 10,
        urlImage: 'Kirkjufell-volcano.png',
        userName: 'markguddestttt',
        likes: 7,
        isSaved: false,
      ),
      Item(
        id: 11,
        urlImage: 'Piramids.png',
        userName: 'Olegprostoooo',
        likes: 7,
        isSaved: false,
      ),
      Item(
        id: 12,
        urlImage: 'Niagara-falls.png',
        userName: 'therockkkk',
        likes: 7,
        isSaved: false,
      ),
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
          margin: const EdgeInsets.only(left: 20),
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
  final int id;
  final String urlImage;
  final String userName;
  final int likes;
  late bool isSaved;

  Item({
    required this.id,
    required this.urlImage,
    required this.userName,
    required this.likes,
    required this.isSaved,
  });
}
