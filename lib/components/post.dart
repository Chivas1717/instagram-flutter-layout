import 'package:flutter/material.dart';
import 'package:flutter_instagram_layout/pages/search_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Post extends StatefulWidget {
  const Post(
      {super.key,
      required this.item,
      required this.isHero,
      required this.updateSaved});

  final Item item;
  final bool isHero;
  final Function updateSaved;

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  bool _isLiked = false;
  final _usersAvatars = {
    'markguddest': 'mark_avatar.png',
    'Olegprosto': 'photo_2022-12-19_01-11-27.png',
    'therock': 'therock_avatar.png'
  };

  void _onClickLike() {
    setState(() {
      _isLiked = _isLiked ? false : true;
    });
  }

  void _onClickSave() {
    setState(() {
      widget.item.isSaved = widget.item.isSaved ? false : true;
      widget.updateSaved(widget.item.isSaved, widget.item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Column(
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
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 25,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage(
                        'assets/imgs/${_usersAvatars[widget.item.userName] ?? 'mark_avatar.png'}',
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Text(
                    widget.item.userName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
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
          widget.isHero
              ? Hero(
                  tag: widget.item,
                  child: Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/imgs/${widget.item.urlImage}',
                      height: 400,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/imgs/${widget.item.urlImage}',
                    height: 400,
                    fit: BoxFit.cover,
                  ),
                ),
          Container(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
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
                            : const Icon(
                                Icons.favorite_border,
                              ),
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
                  icon: Icon(widget.item.isSaved
                      ? Icons.bookmark_outlined
                      : Icons.bookmark_border),
                  iconSize: 30,
                  onPressed: _onClickSave,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 16),
            child: Row(
              children: [
                Text(
                  '${widget.item.likes} likes',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 20, left: 16),
            child: Row(
              children: const [
                Text(
                  '! Comments section is in developement',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    // Scaffold(
    //   body: Column(
    //     children: [
    //       Container(
    //         padding: const EdgeInsets.all(8),
    //         child: Row(
    //           children: [
    //             Container(
    //               width: 50,
    //               height: 50,
    //               padding: const EdgeInsets.all(3),
    //               decoration: const BoxDecoration(
    //                 shape: BoxShape.circle,
    //                 gradient: LinearGradient(colors: [
    //                   Color(0xFFfeda75),
    //                   Color(0xFFfa7e1e),
    //                   Color(0xFFd62976),
    //                   Color(0xFF962fbf),
    //                   Color(0xFF4f5bd5),
    //                 ], begin: Alignment.bottomLeft, end: Alignment.topRight),
    //               ),
    //               child: const CircleAvatar(
    //                 backgroundColor: Colors.white,
    //                 radius: 25,
    //                 child: CircleAvatar(
    //                   radius: 20,
    //                   backgroundColor: Colors.transparent,
    //                   backgroundImage:
    //                       AssetImage('assets/imgs/mark_avatar.png'),
    //                 ),
    //               ),
    //             ),
    //             Container(
    //               margin: const EdgeInsets.only(left: 10),
    //               child: Text(
    //                 widget.item.userName,
    //                 style: const TextStyle(
    //                     fontSize: 16, fontWeight: FontWeight.bold),
    //               ),
    //             ),
    //             Expanded(
    //               child: Container(),
    //             ),
    //             const Icon(
    //               Icons.more_horiz,
    //               size: 30,
    //             ),
    //           ],
    //         ),
    //       ),
    //       Container(
    //         alignment: Alignment.center,
    //         child: Image.asset('assets/imgs/Kirkjufell-volcano.png',
    //             height: 400,
    //             width: MediaQuery.of(context).size.width - 10,
    //             fit: BoxFit.cover),
    //       ),
    //       Container(
    //         padding: const EdgeInsets.all(8),
    //         child: Row(
    //           children: [
    //             Container(
    //               margin: const EdgeInsets.only(left: 5),
    //               width: 110,
    //               child: Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   IconButton(
    //                     padding: EdgeInsets.zero,
    //                     constraints: const BoxConstraints(),
    //                     icon: _isLiked
    //                         ? const Icon(
    //                             Icons.favorite,
    //                             color: Colors.red,
    //                           )
    //                         : const Icon(Icons.favorite_border),
    //                     iconSize: 31,
    //                     onPressed: _onClickLike,
    //                   ),
    //                   IconButton(
    //                     padding: EdgeInsets.zero,
    //                     constraints: const BoxConstraints(),
    //                     icon: const Icon(FontAwesomeIcons.comment),
    //                     iconSize: 27,
    //                     onPressed: () {},
    //                   ),
    //                   IconButton(
    //                     padding: EdgeInsets.zero,
    //                     constraints: const BoxConstraints(),
    //                     icon: const Icon(FontAwesomeIcons.paperPlane),
    //                     iconSize: 27,
    //                     onPressed: () {},
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             Expanded(child: Container()),
    //             IconButton(
    //               padding: EdgeInsets.zero,
    //               constraints: const BoxConstraints(),
    //               icon: const Icon(Icons.save_alt),
    //               iconSize: 30,
    //               onPressed: () {},
    //             ),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
