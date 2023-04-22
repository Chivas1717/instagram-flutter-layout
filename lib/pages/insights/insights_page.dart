import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class InsightsPage extends StatelessWidget {
  const InsightsPage({super.key});

  static final linearTween = Tween<double>(begin: 0, end: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: PageView(children: [
          AnimationAndCurveBlock(
            name: 'Subscribes per month',
            mainCurve: linearTween.chain(CurveTween(curve: const SineCurve())),
            kindOfAnim: KindOfAnimation.repeat,
            duration: const Duration(seconds: 7),
            size: 300,
          ),
          AnimationAndCurveBlock(
            name: 'Likes per month',
            mainCurve:
                linearTween.chain(CurveTween(curve: const SpringCurve())),
            duration: const Duration(seconds: 3),
            size: 300,
          ),
        ]),
      ),
    );
  }
}

class SineCurve extends Curve {
  const SineCurve({this.count = 4});

  final double count;

  // t = x
  @override
  double transformInternal(double t) {
    var val = sin(count * 2 * pi * t - 0.5) * 0.5 + 0.5;
    // var val = sin(2 * pi * t);
    return val; //f(x)
  }
}

class SpringCurve extends Curve {
  const SpringCurve({
    this.a = 0.07,
    this.w = 19.4,
  });
  final double a;
  final double w;

  @override
  double transformInternal(double t) {
    return -(pow(e, -t / a) * cos(t * w)) + 1;
  }
}

enum KindOfAnimation {
  forward,
  repeat,
}

class AnimationAndCurveBlock extends StatefulWidget {
  const AnimationAndCurveBlock({
    Key? key,
    required this.mainCurve,
    this.name = '',
    this.size = 300,
    this.duration = const Duration(seconds: 1),
    this.kindOfAnim = KindOfAnimation.forward,
  }) : super(key: key);

  final Animatable<double> mainCurve;
  final String name;
  final double size;
  final Duration duration;
  final KindOfAnimation kindOfAnim;

  @override
  _AnimationAndCurveBlockState createState() => _AnimationAndCurveBlockState();
}

class _AnimationAndCurveBlockState extends State<AnimationAndCurveBlock>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  Animatable<double> get _mainCurve => widget.mainCurve;
  String get _label => widget.name;
  double get _size => widget.size;
  Duration get _duration => widget.duration;

  KindOfAnimation get _kindOfAnim => widget.kindOfAnim;

  late Path _shadowPath;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: _duration,
    );

    _shadowPath = _buildGraph(_mainCurve);
  }

  Path _buildGraph(Animatable<double> animatable) {
    var val = 0.0;
    var path = Path();
    for (var t = 0.0; t <= 1; t += 0.01) {
      val = -animatable.transform(t) * _size;
      path.lineTo(t * _size, val);
    }
    return path;
  }

  void _playAnimation() {
    _controller.reset();
    if (_kindOfAnim == KindOfAnimation.forward) {
      _controller.forward();
    } else {
      _controller.repeat();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var intervalValue = 0.0;
    var followPath = Path();
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Text(_label, style: Theme.of(context).textTheme.headlineMedium),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: _playAnimation,
            child: const Text('Display tendency'),
          ),
        ),

        Container(
          height: 500,
          // height: 700,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (_, child) {
              if (intervalValue >= _controller.value) {
                followPath.reset();
              }
              intervalValue = _controller.value;

              final val = _mainCurve.evaluate(_controller);
              followPath.lineTo(_controller.value * _size, -val * _size);

              return CustomPaint(
                painter: GraphPainter(
                  shadowPath: _shadowPath,
                  followPath: followPath,
                  currentPoint: Offset(
                    _controller.value * _size,
                    val * _size,
                  ),
                  graphSize: _size,
                ),
                child: Container(),
              );
            },
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Colors.white),
          child: const Center(
            child: Text(
              'Swipe for more -->',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        Expanded(
            child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Colors.white),
        ))
        // SizedBox(
        //   height: 100,
        // )
      ],
    );
  }
}

class GraphPainter extends CustomPainter {
  const GraphPainter({
    required this.currentPoint,
    required this.shadowPath,
    required this.followPath,
    required this.graphSize,
  });

  final Offset currentPoint;
  final Path shadowPath;
  final Path followPath;
  final double graphSize;

  static final backgroundPaint = Paint()..color = Colors.white;
  static final currentPointPaint = Paint()..color = Colors.red;
  static final shadowPaint = Paint()
    ..color = Colors.grey
    ..style = PaintingStyle.stroke
    ..strokeWidth = 3;
  static final followPaint = Paint()
    ..color = Colors.blue
    ..style = PaintingStyle.stroke
    ..strokeWidth = 4;
  static final borderPaint = Paint()
    ..color = Colors.grey[900]!
    ..style = PaintingStyle.stroke
    ..strokeWidth = 3;

  @override
  void paint(Canvas canvas, Size size) {
    _drawBackground(canvas, size);
    canvas.translate(
        size.width / 2 - graphSize / 2, size.height / 2 - graphSize / 2);
    _drawBorder(canvas, size);
    canvas.translate(0, graphSize);
    canvas
      ..drawPath(shadowPath, shadowPaint)
      ..drawPath(followPath, followPaint)
      ..drawCircle(
          Offset(currentPoint.dx, -currentPoint.dy), 4, currentPointPaint);
  }

  void _drawBackground(Canvas canvas, Size size) {
    canvas.drawRect(
        Rect.fromLTWH(0, 0, size.width, size.height), backgroundPaint);
  }

  void _drawBorder(Canvas canvas, Size size) {
    canvas
      ..drawLine(const Offset(0, 0), Offset(0, graphSize), borderPaint)
      ..drawLine(
          Offset(0, graphSize), Offset(graphSize, graphSize), borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
