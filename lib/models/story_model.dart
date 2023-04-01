import 'package:flutter/material.dart';

class StoryModel extends ChangeNotifier {
  List<Story> _items = <Story>[
    Story(
      id: 1,
      userName: '1',
      image: 'mark_avatar.png',
      isWatched: false,
    ),
    Story(
      id: 2,
      userName: '2',
      image: 'mark_avatar.png',
      isWatched: false,
    ),
    Story(
      id: 3,
      userName: '3',
      image: 'mark_avatar.png',
      isWatched: false,
    ),
    Story(
      id: 4,
      userName: '4',
      image: 'mark_avatar.png',
      isWatched: false,
    ),
    Story(
      id: 5,
      userName: 'markguddest',
      image: 'mark_avatar.png',
      isWatched: false,
    ),
    Story(
      id: 6,
      userName: 'markguddest',
      image: 'mark_avatar.png',
      isWatched: false,
    ),
    Story(
      id: 7,
      userName: 'markguddest',
      image: 'mark_avatar.png',
      isWatched: false,
    ),
    Story(
      id: 8,
      userName: 'markguddest',
      image: 'mark_avatar.png',
      isWatched: false,
    ),
    Story(
      id: 9,
      userName: '9',
      image: 'mark_avatar.png',
      isWatched: false,
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

  void makeWatched2(Story story) {
    for (var element in _items) {
      if (story.id == element.id) element.isWatched = true;
    }

    notifyListeners();
  }
}

class Story {
  final String userName, image;
  final int id;
  bool isWatched;

  Story({
    required int this.id,
    required String this.userName,
    required String this.image,
    required bool this.isWatched,
  });
}
