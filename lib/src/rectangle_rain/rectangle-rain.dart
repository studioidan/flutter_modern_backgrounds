import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_modern_backgrounds/src/rectangle_rain/rectangle.dart';
import 'package:tinycolor/tinycolor.dart';

class RectangleRain extends StatefulWidget {
  final List<Color> colors;
  Size size;

  RectangleRain({this.colors = const [Colors.lightBlue, Colors.yellowAccent, Colors.black26, Colors.redAccent]});

  @override
  _RectangleRainState createState() => _RectangleRainState();
}

class _RectangleRainState extends State<RectangleRain> with TickerProviderStateMixin {
  List<Rectangle> items = [];
  AnimationController controller;

  @override
  void initState() {
    super.initState();

    // refresh page
    Timer.periodic(Duration(milliseconds: 10), (timer) {
      // print('refresh');
      setState(() {});
    });

    // dots add
    Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
        addPoint();
      });
    });

    // dots remove
    Timer.periodic(Duration(milliseconds: 700), (timer) {
      items.removeWhere((d) => d.tween.status == AnimationStatus.completed);
    });
  }

  @override
  void didChangeDependencies() {
    if (widget.size == null) widget.size = MediaQuery.of(context).size;
    super.didChangeDependencies();
  }

  void addPoint() {
    if (widget.size == null) widget.size = MediaQuery.of(context).size;
    if (widget.size == null) return;
    AnimationController controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: (Random().nextDouble() * 1000).toInt() + 2000));
    items.add(Rectangle(widget.size, widget.colors, controller));
  }

  @override
  Widget build(BuildContext context) {
    if (widget.size == null) return Text('');
    return FutureBuilder(
        future: Future.delayed(Duration(milliseconds: 100)),
        builder: (context, snapshot) {
          return GestureDetector(
            onTap: () => addPoint(),
            child: Container(
              width: widget.size.width * 2,
              height: widget.size.height,
              // color: widget.bgColor,
              child: CustomPaint(
                // size: size,
                painter: RectangleRainPainter(items),
              ),
            ),
          );
        });
  }
}

class RectangleRainPainter extends CustomPainter {
  final List<Rectangle> items;

  Color dotColor;
  Color lineColor;

  Paint dotPaint;

  // Paint linePaint;

  var maxDistance = 200.0;

  RectangleRainPainter(this.items) {
    this.dotColor = dotColor;
    // this.lineColor = lineColor;

    dotPaint = Paint()
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;
  }

  @override
  void paint(Canvas canvas, Size size) {
    items.forEach((dot) {
      if (dot.tween.status != AnimationStatus.forward) return;

      final rect = new Rect.fromPoints(dot.getLine1(), dot.getLine2());
      final gradient = new LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [dot.color, TinyColor(dot.color).brighten(40).color],
      );

      dotPaint.shader = gradient.createShader(rect);
      dotPaint.strokeWidth = dot.rectWidth;
      // canvas.drawRect(dot.rect, dotPaint);
      canvas.drawLine(dot.getLine1(), dot.getLine2(), dotPaint);
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
