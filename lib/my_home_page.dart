import 'package:flutter/material.dart';
import 'package:flutter_instagram_layout/wrapper_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double varOpacity = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.purple, Colors.orange],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Container()),
            Center(
              child: Column(
                children: [
                  TweenAnimationBuilder(
                    onEnd: () {
                      setState(() {
                        varOpacity = 1;
                      });
                    },
                    curve: Curves.bounceOut,
                    tween: Tween<double>(begin: 30, end: 80),
                    duration: Duration(seconds: 2),
                    builder: (BuildContext context, dynamic value, child) =>
                        FaIcon(
                      FontAwesomeIcons.instagram,
                      size: value,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 600),
                    opacity: varOpacity,
                    child: const Text(
                      'Welcome!',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: Container()),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(70),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const WrapperPage(title: 'SecondPage');
                }));
              },
              child: const Text(
                'Log in',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
