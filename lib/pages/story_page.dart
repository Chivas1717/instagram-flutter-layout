import 'package:flutter/material.dart';
import 'package:flutter_instagram_layout/components/story.dart';
import 'package:provider/provider.dart';

import '../models/story_model.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({super.key, required this.index});

  final int index;

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> with TickerProviderStateMixin {
  int _selectedStoryIndex = 0;
  late TabController _storiesController;

  List<Widget> _storiesOptions = [];

  @override
  // ignore: must_call_super
  void initState() {
    super.initState();
    _storiesController = TabController(
      length: _storiesOptions.length,
      vsync: this,
    );
    _storiesController.addListener(
      () {
        setState(() {
          _selectedStoryIndex = _storiesController.index;
        });
      },
    );
  }

  @override
  void dispose() {
    _storiesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _storiesController.index = widget.index;
    _storiesOptions = Provider.of<StoryModel>(context, listen: true)
        .items
        .map((story) => StoryTab(
              story: story,
            ))
        .toList();

    _storiesController = TabController(
      length: _storiesOptions.length,
      initialIndex: widget.index,
      vsync: this,
    );
    // _storiesController.addListener(() {
    //   if (_storiesController.indexIsChanging)
    //     Provider.of<StoryModel>(context, listen: false)
    //         .makeWatched(_storiesController.index);
    // });

    final List<Widget> widgetOptions = _storiesOptions;
    return Consumer<StoryModel>(builder: (context, story, child) {
      return Scaffold(
        body: TabBarView(
          controller: _storiesController,
          children: widgetOptions,
        ),
      );
    });
  }
}
