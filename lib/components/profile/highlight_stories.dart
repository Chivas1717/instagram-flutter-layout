import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/story_settings.dart';
import '../../providers/theme_settings.dart';

class HighlightStories extends StatelessWidget {
  final storiesList = [
    Story(
      id: 1,
      userName: 'Cat',
      image: 'mark_avatar.png',
      isWatched: true,
      content: 'Niagara-falls.png',
    ),
    Story(
      id: 1,
      userName: 'Life',
      image: 'mark_avatar.png',
      isWatched: true,
      content: 'Niagara-falls.png',
    ),
    Story(
      id: 1,
      userName: 'School',
      image: 'mark_avatar.png',
      isWatched: true,
      content: 'Niagara-falls.png',
    ),
    Story(
      id: 1,
      userName: 'Trips',
      image: 'mark_avatar.png',
      isWatched: true,
      content: 'Niagara-falls.png',
    ),
    Story(
      id: 1,
      userName: 'Friends',
      image: 'mark_avatar.png',
      isWatched: true,
      content: 'Niagara-falls.png',
    ),
  ];
  HighlightStories({super.key});

  @override
  Widget build(BuildContext context) {
    bool themeDark =
        Provider.of<ThemeSettings>(context, listen: true).selectedTheme ==
            ThemeData.dark();

    return Container(
      height: 99,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(top: 10.0),
      padding: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: const Border(
          bottom: BorderSide(
            color: Color.fromARGB(255, 201, 199, 195),
            width: 0.4,
          ),
        ),
        color: themeDark ? Colors.grey[860] : Colors.white,
      ),
      child: ListView.builder(
        itemCount: storiesList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                width: 68,
                height: 68,
                padding: const EdgeInsets.all(1),
                margin: const EdgeInsets.only(left: 5, right: 5, bottom: 4),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.grey),
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 34,
                  child: CircleAvatar(
                    radius: 29,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage(
                      'assets/imgs/therock_avatar.png',
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 68,
                child: Center(
                  child: Text(
                    'highlights',
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
