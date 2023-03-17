import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instagram_layout/pages/post_page.dart';

class RecomendationsBlock extends StatefulWidget {
  const RecomendationsBlock({super.key, required this.i, required this.posts});

  final int i;
  final List posts;

  @override
  State<RecomendationsBlock> createState() => _RecomendationsBlockState();
}

class _RecomendationsBlockState extends State<RecomendationsBlock> {
  var rng = Random();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 241,
      margin: const EdgeInsets.only(top: 1),
      child: widget.i % 2 == 0
          ? Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                PostPage(item: widget.posts[0]),
                          ),
                        ),
                        child: SizedBox(
                          height: 120,
                          child: Hero(
                            tag: widget.posts[0],
                            child: Image.asset(
                              'assets/imgs/${widget.posts[0].urlImage}',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                PostPage(item: widget.posts[1]),
                          ),
                        ),
                        child: SizedBox(
                          height: 120,
                          child: Hero(
                            tag: widget.posts[1],
                            child: Image.asset(
                              'assets/imgs/${widget.posts[1].urlImage}',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 1,
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                PostPage(item: widget.posts[2]),
                          ),
                        ),
                        child: SizedBox(
                          height: 241,
                          child: Hero(
                            transitionOnUserGestures: true,
                            tag: widget.posts[2],
                            child: Image.asset(
                              'assets/imgs/${widget.posts[2].urlImage}',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   height: 120,
                      //   child: Image.asset(
                      //     'assets/imgs/Kirkjufell-volcano.png',
                      //     fit: BoxFit.cover,
                      //   ),
                      // ),
                    ],
                  ),
                ),
                // const SizedBox(
                //   width: 1,
                // ),
                // Expanded(
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       SizedBox(
                //         height: 120,
                //         child: Image.asset(
                //           'assets/imgs/Kirkjufell-volcano.png',
                //           fit: BoxFit.cover,
                //         ),
                //       ),
                //       SizedBox(
                //         height: 120,
                //         child: Image.asset(
                //           'assets/imgs/Kirkjufell-volcano.png',
                //           fit: BoxFit.cover,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            )
          : Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                PostPage(item: widget.posts[0]),
                          ),
                        ),
                        child: SizedBox(
                          height: 241,
                          child: Hero(
                            transitionOnUserGestures: true,
                            tag: widget.posts[0],
                            child: Image.asset(
                              'assets/imgs/${widget.posts[0].urlImage}',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   height: 120,
                      //   child: Image.asset(
                      //     'assets/imgs/Kirkjufell-volcano.png',
                      //     fit: BoxFit.cover,
                      //   ),
                      // ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 1,
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                PostPage(item: widget.posts[1]),
                          ),
                        ),
                        child: SizedBox(
                          height: 120,
                          child: Hero(
                            transitionOnUserGestures: true,
                            tag: widget.posts[1],
                            child: Image.asset(
                              'assets/imgs/${widget.posts[1].urlImage}',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                PostPage(item: widget.posts[2]),
                          ),
                        ),
                        child: SizedBox(
                          height: 120,
                          child: Hero(
                            transitionOnUserGestures: true,
                            tag: widget.posts[2],
                            child: Image.asset(
                              'assets/imgs/${widget.posts[2].urlImage}',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // const SizedBox(
                //   width: 1,
                // ),
                // Expanded(
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       SizedBox(
                //         height: 120,
                //         child: Image.asset(
                //           'assets/imgs/Kirkjufell-volcano.png',
                //           fit: BoxFit.cover,
                //         ),
                //       ),
                //       SizedBox(
                //         height: 120,
                //         child: Image.asset(
                //           'assets/imgs/Kirkjufell-volcano.png',
                //           fit: BoxFit.cover,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
    );
  }
}
