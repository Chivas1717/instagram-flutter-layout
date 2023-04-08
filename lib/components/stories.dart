import 'package:flutter/material.dart';
import 'package:flutter_instagram_layout/pages/story_page.dart';
import 'package:provider/provider.dart';

import '../providers/story_model.dart';
import '../providers/theme_settings.dart';

class Stories extends StatefulWidget {
  const Stories({super.key});

  @override
  State<Stories> createState() => _StoriesState();
}

class _StoriesState extends State<Stories> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 99,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(top: 10.0),
      padding: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: const Border(
          bottom:
              BorderSide(color: Color.fromARGB(255, 201, 199, 195), width: 0.4),
        ),
        color: Provider.of<ThemeSettings>(context, listen: true).isDark == true
            ? Colors.grey[860]
            : Colors.white,
      ),
      child: Consumer<StoryModel>(
        builder: (context, story, child) {
          return ListView.builder(
            itemCount: story.items.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return StoryPage(
                      index: index,
                    );
                  }));
                  story.makeWatched(index);
                },
                child: Column(
                  children: [
                    Container(
                      width: 68,
                      height: 68,
                      padding: const EdgeInsets.all(3),
                      margin: const EdgeInsets.only(
                        left: 5,
                        right: 5,
                        bottom: 4,
                      ),
                      decoration: story.items[index].isWatched
                          ? BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.grey,
                              ),
                            )
                          : const BoxDecoration(
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
                                end: Alignment.topRight,
                              ),
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
