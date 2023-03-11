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
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Container(
          height: 30,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: 0),
              hintText: 'Пошук',
              border: InputBorder.none,
              prefix: Icon(Icons.search),
              isDense: true,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
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
                return const RecomendationsBlock();
              },
            ),
          ),
        ],
      ),
    );
  }
}
