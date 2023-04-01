import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/story_model.dart';

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
      decoration: BoxDecoration(
        color: Colors.black,
      ),
      child: Stack(
        children: [
          Positioned(
            top: 50,
            right: 20,
            child: InkWell(
              borderRadius: BorderRadius.circular(30),
              onTap: () => Navigator.of(context).pop(),
              child: Ink(
                child: const Icon(
                  Icons.close,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Center(
              child: Text(
            'test wdadwadawwda ',
            style: TextStyle(color: Colors.white),
          ))
        ],
      ),
    );
  }
}
