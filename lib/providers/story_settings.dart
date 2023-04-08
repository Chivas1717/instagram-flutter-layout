import 'package:flutter/material.dart';

class StoryModel extends ChangeNotifier {
  List<Story> _items = <Story>[
    Story(
      id: 1,
      userName: 'markguddest',
      image: 'mark_avatar.png',
      isWatched: false,
      content: 'Niagara-falls.png',
    ),
    Story(
      id: 2,
      userName: 'oleg_prosto',
      image: 'photo_2022-12-19_01-11-27.png',
      isWatched: false,
      content: 'Piramids.png',
    ),
    Story(
      id: 3,
      userName: 'therock',
      image: 'therock_avatar.png',
      isWatched: false,
      content: 'fetchimage.png',
    ),
    Story(
      id: 4,
      userName: 'selena_gomez',
      image: 'blank-profile-picture.png',
      isWatched: false,
      content: 'Niagara-falls.png',
    ),
    Story(
      id: 5,
      userName: 'adam',
      image: 'blank-profile-picture.png',
      isWatched: false,
      content: 'Niagara-falls.png',
    ),
    Story(
      id: 6,
      userName: 'faonfafa',
      image: 'blank-profile-picture.png',
      isWatched: false,
      content: 'Niagara-falls.png',
    ),
    Story(
      id: 7,
      userName: 'wqeeqeqe',
      image: 'blank-profile-picture.png',
      isWatched: false,
      content: 'Niagara-falls.png',
    ),
    Story(
      id: 8,
      userName: 'hellolol',
      image: 'blank-profile-picture.png',
      isWatched: false,
      content: 'Niagara-falls.png',
    ),
    Story(
      id: 9,
      userName: 'temporary',
      image: 'blank-profile-picture.png',
      isWatched: false,
      content: 'Niagara-falls.png',
    ),
  ];

  List<Story> get items => (_items);

  void add(Story item) {
    _items.add(item);

    notifyListeners();
  }

  void addMany(List<Story> temp) {
    _items = [
      ..._items,
      ...temp,
    ];

    notifyListeners();
  }

  void makeWatched(int index) {
    _items[index].isWatched = true;

    notifyListeners();
  }
}

class Story {
  final String userName, image, content;
  final int id;
  bool isWatched;

  Story({
    required this.id,
    required this.userName,
    required this.image,
    required this.content,
    required this.isWatched,
  });
}
