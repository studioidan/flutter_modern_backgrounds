import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import 'dot.dart';

// test
class Particles extends StatefulWidget {
  Color dotColor;
  Color lineColor;
  Color bgColor;
  Size size;

  Particles({this.dotColor = Colors.white, this.lineColor = Colors.white, this.bgColor = const Color(0xFF713D99), this.size});

  @override
  _ParticlesState createState() => _ParticlesState();
}

class _ParticlesState extends State<Particles> with TickerProviderStateMixin {
  List<Dot> dots = [];

  @override
  void initState() {
    super.initState();

    // refresh page
    Timer.periodic(Duration(milliseconds: 30), (timer) {
      setState(() {});
    });

    // dots add
    Timer.periodic(Duration(milliseconds: 400), (timer) {
      addPoint();
    });

    // dots remove
    Timer.periodic(Duration(milliseconds: 700), (timer) {
      //test
      dots.removeWhere((d) => d.tween.status == AnimationStatus.completed);
    });
  }

  void addPoint() {
    if (widget.size == null) {
      widget.size = MediaQuery.of(context).size;
      setState(() {});
      return;
    }

    AnimationController controller = AnimationController(vsync: this, duration: Duration(seconds: Random().nextInt(11) + 9));
    dots.add(Dot(widget.size, controller));
  }

  @override
  Widget build(BuildContext context) {
    if (widget.size == null) return SizedBox();
    return Container(
      width: widget.size.width,
      height: widget.size.height,
      color: widget.bgColor,
      child: CustomPaint(
        // size: size,
        painter: MyPainter(dots, widget.dotColor, widget.lineColor),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final List<Dot> dots;

  Color dotColor;
  Color lineColor;

  Paint dotPaint;
  Paint linePaint;

  var maxDistance = 200.0;

  MyPainter(this.dots, this.dotColor, this.lineColor) {
    this.dotColor = dotColor;
    this.lineColor = lineColor;

    dotPaint = Paint()
      ..color = dotColor
      ..style = PaintingStyle.fill;

    linePaint = Paint()
      ..color = lineColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill
      ..strokeWidth = 0.8;
  }

  @override
  void paint(Canvas canvas, Size size) {
    this.maxDistance = min(size.height, size.width) * 0.24;

    dots.forEach((dot) {
      if (dot.tween.status != AnimationStatus.forward) return;
      canvas.drawCircle(dot.offset, dot.dotSize, dotPaint);

      // draw line to each of other dots
      dots.forEach((otherDot) {
        if (otherDot.tween.status != AnimationStatus.forward) return;
        var distance = (dot.offset - otherDot.offset).distance;
        if (distance > maxDistance) return;
        double distanceRatio = 1 - (distance / maxDistance);
        int alpha = (distanceRatio * 255).toInt();
        linePaint.color = lineColor.withAlpha(alpha);
        canvas.drawLine(dot.offset, otherDot.offset, linePaint);
      });
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
