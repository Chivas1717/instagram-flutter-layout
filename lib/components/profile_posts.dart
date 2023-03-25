import 'package:flutter/cupertino.dart';

import '../pages/search_page.dart';

class ProfilePosts extends StatelessWidget {
  const ProfilePosts({super.key});
  final items = const <Item>[
    Item(
      id: 1,
      urlImage: 'Kirkjufell-volcano.png',
      userName: 'markguddest',
      likes: 7,
    ),
    Item(
      id: 1,
      urlImage: 'Piramids.png',
      userName: 'Olegprosto',
      likes: 7,
    ),
    Item(
      id: 1,
      urlImage: 'Niagara-falls.png',
      userName: 'therock',
      likes: 7,
    ),
    Item(
      id: 1,
      urlImage: 'Kirkjufell-volcano.png',
      userName: 'markguddest',
      likes: 7,
    ),
    Item(
      id: 1,
      urlImage: 'Piramids.png',
      userName: 'Olegprosto',
      likes: 7,
    ),
    Item(
      id: 1,
      urlImage: 'Niagara-falls.png',
      userName: 'therock',
      likes: 7,
    ),
    Item(
      id: 1,
      urlImage: 'Kirkjufell-volcano.png',
      userName: 'markguddest',
      likes: 7,
    ),
    Item(
      id: 1,
      urlImage: 'Piramids.png',
      userName: 'Olegprosto',
      likes: 7,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SizedBox(
              height: 120,
              child: Image.asset(
                'assets/imgs/Kirkjufell-volcano.png',
                fit: BoxFit.cover,
              ),
            ),
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
    );
  }
}
