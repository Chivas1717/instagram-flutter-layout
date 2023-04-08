import 'package:flutter/material.dart';

import '../providers/story_settings.dart';

class StoryTab extends StatelessWidget {
  const StoryTab({super.key, required this.story});

  final Story story;

  @override
  Widget build(BuildContext context) {
    //
    story.isWatched = true;

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/imgs/${story.content}',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 70,
            right: 20,
            child: InkWell(
              borderRadius: BorderRadius.circular(30),
              onTap: () => Navigator.of(context).pop(),
              child: Ink(
                child: const Icon(
                  Icons.close,
                  size: 40,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const Positioned(
            top: 70,
            right: 65,
            child: Icon(
              Icons.more_horiz_outlined,
              size: 40,
              color: Colors.white,
            ),
          ),
          Positioned(
              top: 70,
              left: 20,
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage(
                        'assets/imgs/${story.image}',
                      ),
                    ),
                  ),
                  Text(
                    story.userName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
