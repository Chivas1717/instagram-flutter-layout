import 'package:flutter/material.dart';
import 'package:flutter_instagram_layout/pages/search_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/post.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key, required this.item});

  final Item item;

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  bool _isLiked = false;

  void _onClickLike() {
    setState(() {
      _isLiked = _isLiked ? false : true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    padding: const EdgeInsets.all(3),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(colors: [
                        Color(0xFFfeda75),
                        Color(0xFFfa7e1e),
                        Color(0xFFd62976),
                        Color(0xFF962fbf),
                        Color(0xFF4f5bd5),
                      ], begin: Alignment.bottomLeft, end: Alignment.topRight),
                    ),
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 25,
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.transparent,
                        backgroundImage:
                            AssetImage('assets/imgs/mark_avatar.png'),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: const Text(
                      'markguddest',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  const Icon(
                    Icons.more_horiz,
                    size: 30,
                  ),
                ],
              ),
            ),
            Hero(
              tag: widget.item,
              child: Container(
                alignment: Alignment.center,
                child: Image.asset('assets/imgs/Kirkjufell-volcano.png',
                    height: 400,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Row(children: [
                Container(
                  margin: const EdgeInsets.only(left: 5),
                  width: 110,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        icon: _isLiked
                            ? const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            : const Icon(Icons.favorite_border),
                        iconSize: 31,
                        onPressed: _onClickLike,
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        icon: const Icon(FontAwesomeIcons.comment),
                        iconSize: 27,
                        onPressed: () {},
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        icon: const Icon(FontAwesomeIcons.paperPlane),
                        iconSize: 27,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                Expanded(child: Container()),
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: const Icon(Icons.save_alt),
                  iconSize: 30,
                  onPressed: () {},
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}