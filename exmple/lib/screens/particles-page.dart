import 'package:flutter/material.dart';
import 'package:flutter_modern_backgrounds/flutter_modern_backgrounds.dart';

class ParticlesPage extends StatefulWidget {
  @override
  _ParticlesPageState createState() => _ParticlesPageState();
}

class _ParticlesPageState extends State<ParticlesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Particles(
          // dotColor: Colors.white,
          // lineColor: Colors.amber,
          // bgColor:   Colors.grey
          // size: Size(400, 400),
          ),
    ]));
  }
}
