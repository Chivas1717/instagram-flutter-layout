import 'package:flutter/material.dart';

class StoryTab extends StatelessWidget {
  const StoryTab({super.key});

  @override
  Widget build(BuildContext context) {
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
        ],
      ),
    );
  }
}
