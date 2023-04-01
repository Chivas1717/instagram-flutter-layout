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

  // void makeWatched2(Story story) {
  //   for (var element in _items) {
  //     if (story.id == element.id) element.isWatched = true;
  //   }

  //   notifyListeners();
  // }
}

class Story {
  final String userName, image, content;
  final int id;
  bool isWatched;

  Story({
    required int this.id,
    required String this.userName,
    required String this.image,
    required String this.content,
    required bool this.isWatched,
  });
}