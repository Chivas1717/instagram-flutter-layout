import 'package:flutter/cupertino.dart';

import '../pages/search_page.dart';

class ProfilePosts extends StatelessWidget {
  ProfilePosts({super.key});
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
    return Column(
      // margin: EdgeInsets.only(left: 10, right: 10),
      children: [
        for (int i = 0; i < 8; i++)
          Container(
            height: 122,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 120,
                    child: Image.asset(
                      'assets/imgs/Piramids.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 1,
                ),
                Expanded(
                  child: SizedBox(
                    height: 120,
                    child: Image.asset(
                      'assets/imgs/Niagara-falls.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 1,
                ),
                Expanded(
                  child: SizedBox(
                    height: 120,
                    child: Image.asset(
                      'assets/imgs/Kirkjufell-volcano.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
