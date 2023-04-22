import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ButtonFollow extends StatefulWidget {
  ButtonFollow({super.key, required this.isFollowed});
  bool isFollowed;

  @override
  State<ButtonFollow> createState() => _ButtonFollowState();
}

class _ButtonFollowState extends State<ButtonFollow> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.isFollowed = !widget.isFollowed;
        });
      },
      child: Container(
        width: 90,
        padding: EdgeInsets.only(top: 5, bottom: 5, left: 15, right: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: widget.isFollowed ? Colors.grey[800] : Colors.blue,
        ),
        child: Center(
          child: Text(widget.isFollowed ? 'Following' : 'Follow'),
        ),
      ),
    );
  }
}
