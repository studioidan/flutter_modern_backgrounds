import 'dart:math';
import 'dart:ui';

import 'package:flutter/widgets.dart';

class Dot {
  Offset offset;
  Animation<Offset> tween;
  double dotSize;

  Dot(Size size, AnimationController controller) {
    this.offset = Offset.zero;

    this.dotSize = Random().nextDouble() * 2.4 + 1;
    // randomize start end positions
    Offset startPos = Offset(Random().nextDouble() * size.width, Random().nextDouble() * size.height);
    startPos = snapToClosestEdge(startPos, size);

    Offset endPos = Offset(Random().nextDouble() * size.width, Random().nextDouble() * size.height);
    endPos = snapToClosestEdge(endPos, size);

    // make sure the points are not on the same axes
    while ((startPos.dx == endPos.dx) || (startPos.dy == endPos.dy)) {
      startPos = Offset(Random().nextDouble() * size.width, Random().nextDouble() * size.height);
      startPos = snapToClosestEdge(startPos, size);

      endPos = Offset(Random().nextDouble() * size.width, Random().nextDouble() * size.height);
      endPos = snapToClosestEdge(endPos, size);
    }

    // start animation
    tween = new Tween(begin: startPos, end: endPos).animate(controller)
      ..addListener(() {
        // print('anim value: ' + tween.value.toString());
        this.offset = tween.value;
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.dispose();
        }
      });

    controller.forward();
  }

  Offset snapToClosestEdge(Offset offset, Size size) {
    var distanceFromTop = offset.dy;
    var distanceFromBottom = size.height - offset.dy;
    var distanceFromLeft = offset.dx;
    var distanceFromRight = size.width - offset.dx;
    var minimum = [distanceFromTop, distanceFromBottom, distanceFromLeft, distanceFromRight].reduce(min);
    if (minimum == distanceFromTop) {
      return Offset(offset.dx, 0);
    } else if (minimum == distanceFromRight) {
      return Offset(size.width, offset.dy);
    } else if (minimum == distanceFromBottom) {
      return Offset(offset.dx, size.height);
    } else {
      // snap to left
      return Offset(0, offset.dy);
    }
  }
}
