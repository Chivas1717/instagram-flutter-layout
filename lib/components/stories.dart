import 'package:flutter/material.dart';
import 'package:flutter_instagram_layout/pages/story_page.dart';
import 'package:provider/provider.dart';

import '../models/story_model.dart';

class Stories extends StatelessWidget {
  const Stories({super.key});

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
      child: Consumer<StoryModel>(
        builder: (context, story, child) {
          story.addMany([
            Story(userName: 'markguddest', image: 'mark_avatar.png'),
            Story(userName: 'markguddest', image: 'mark_avatar.png'),
            Story(userName: 'markguddest', image: 'mark_avatar.png'),
            Story(userName: 'markguddest', image: 'mark_avatar.png'),
            Story(userName: 'markguddest', image: 'mark_avatar.png'),
            Story(userName: 'markguddest', image: 'mark_avatar.png'),
            Story(userName: 'markguddest', image: 'mark_avatar.png'),
            Story(userName: 'markguddest', image: 'mark_avatar.png'),
          ]);

          return ListView.builder(
            itemCount: story.items.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const StoryPage();
                  }));
                },
                child: Column(
                  children: [
                    Container(
                      width: 68,
                      height: 68,
                      padding: const EdgeInsets.all(3),
                      margin:
                          const EdgeInsets.only(left: 5, right: 5, bottom: 4),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            colors: [
                              Color(0xFFfeda75),
                              Color(0xFFfa7e1e),
                              Color(0xFFd62976),
                              Color(0xFF962fbf),
                              Color(0xFF4f5bd5),
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight),
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 34,
                        child: CircleAvatar(
                          radius: 29,
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage(
                            'assets/imgs/${story.items[index].image}',
                          ),
                        ),
                      ),
                    ),
                    // Text(
                    //   'Olegggggg'.length > 8
                    //       ? 'Olegggggg'.replaceRange(7, 'Olegggggg'.length, '...')
                    //       : 'Olegggggg',
                    // )
                    SizedBox(
                      width: 68,
                      child: Center(
                        child: Text(
                          story.items[index].userName,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
