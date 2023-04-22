import 'package:flutter/material.dart';
import 'package:flutter_instagram_layout/components/home/story.dart';
import 'package:provider/provider.dart';

import '../../providers/story_settings.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({super.key, required this.index});

  final int index;

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> with TickerProviderStateMixin {
  late TabController _storiesController;

  List<Widget> _storiesOptions = [];

  @override
  // ignore: must_call_super
  void initState() {
    super.initState();
    _storiesController = TabController(
      length: 9,
      initialIndex: widget.index,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _storiesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _storiesOptions = Provider.of<StoryModel>(context, listen: true)
        .items
        .map((story) => StoryTab(
              story: story,
            ))
        .toList();

    _storiesController.dispose();

    int prev = _storiesController.index;

    _storiesController = TabController(
      length: _storiesOptions.length,
      initialIndex: prev,
      vsync: this,
    );

    _storiesController.addListener(
      () {
        if (!_storiesController.indexIsChanging) {
          Future.delayed(
            const Duration(milliseconds: 10),
            () {
              Provider.of<StoryModel>(context, listen: false)
                  .makeWatched(_storiesController.index);
            },
          );
        }
      },
    );

    return Consumer<StoryModel>(builder: (context, story, child) {
      return Scaffold(
        body: TabBarView(
          controller: _storiesController,
          children: _storiesOptions,
        ),
      );
    });
  }
}
