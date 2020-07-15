import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Rectangle {
  Offset center;
  Animation<double> tween;
  double rectHeight;
  double rectWidth;
  double dx;
  Rect rect;
  Color color;

  Rectangle(Size size, List<Color> colors, AnimationController controller) {
    this.dx = Random().nextDouble() * size.width * 4;
    this.center = Offset(this.dx, size.height);

    this.rectHeight = Random().nextDouble() * 10 + 40;
    this.rectWidth = Random().nextDouble() * 1 + 10;

    this.color = colors[Random().nextInt(colors.length)];
    rect = Rect.fromCenter(center: this.center, width: this.rectWidth, height: this.rectHeight);

    // start animation
    tween = new Tween<double>(begin: size.height + rectHeight, end: 0).animate(controller)
      ..addListener(() {
        // print('anim value: ' + tween.value.toString());
        this.center = Offset(this.dx, tween.value);
        this.rect = Rect.fromCenter(center: this.center, width: 1, height: this.rectHeight);
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.dispose();
        }
      });

    controller.forward();
  }

  Offset getLine1() {
    return Offset(dx, tween.value);
  }

  Offset getLine2() {
    return Offset(dx, tween.value - this.rectHeight);
  }
}
