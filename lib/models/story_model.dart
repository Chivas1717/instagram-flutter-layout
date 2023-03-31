import 'dart:collection';

import 'package:flutter/material.dart';

class StoryModel extends ChangeNotifier {
  List<Story> _items = <Story>[];

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
  }

  // void makeWatched(int index) {
  //   _items[index].isWatched = true;

  //   notifyListeners();
  // }
}

class Story {
  final String userName, image;
  late bool isWatched;

  Story({
    required String this.userName,
    required String this.image,
    bool isWatched = false,
  });
}
