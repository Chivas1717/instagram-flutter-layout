import 'package:flutter/material.dart';
import 'package:flutter_instagram_layout/components/stories.dart';

class HighlightStories extends StatelessWidget {
  final storiesList = [
    Story(userName: 'Cat', image: 'mark_avatar.png'),
    Story(userName: 'Life', image: 'mark_avatar.png'),
    Story(userName: 'School', image: 'mark_avatar.png'),
    Story(userName: 'Trips', image: 'mark_avatar.png'),
    Story(userName: 'Friends', image: 'mark_avatar.png'),
  ];
  HighlightStories({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 99,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(top: 10.0),
      padding: const EdgeInsets.only(bottom: 10),
      decoration: const BoxDecoration(
        border: Border(
          bottom:
              BorderSide(color: Color.fromARGB(255, 201, 199, 195), width: 0.4),
        ),
        color: Colors.white,
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
                      'assets/imgs/photo_2022-12-19_01-11-27.png',
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 68,
                child: Center(
                  child: Text(
                    'storiesList[index].userName',
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