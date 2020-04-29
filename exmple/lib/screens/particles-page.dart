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
          bgColor: Colors.pink
          // size: Size(400, 400),
          ),
      Container(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(top: 90, left: 40, right: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'images/logo.png',
                  height: 150,
                ),
                SizedBox(height: 100),
                TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: 'Email',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.white, width: 2.0, style: BorderStyle.solid))),
                ),
                SizedBox(height: 20),
                TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: 'Password',
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.white, width: 2.0, style: BorderStyle.solid))),
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: MaterialButton(
                    color: Colors.white,
                    child: Text(
                      'Sign in',
                      style: TextStyle(color: Colors.pink, fontSize: 25),
                    ),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ),
        ),
      )
    ]));
  }
}
