import 'package:flutter/material.dart';
import 'package:flutter_instagram_layout/components/recomendations_block.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/imgs/mark_avatar.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Expanded(
            child: ListView.builder(
                itemCount: 12,
                itemBuilder: (context, index) {
                  return RecomendationsBlock();
                }))
      ]),
    );
  }
}
