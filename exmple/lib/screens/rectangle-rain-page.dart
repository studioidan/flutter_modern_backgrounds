import 'package:flutter/material.dart';
import 'package:flutter_modern_backgrounds/flutter_modern_backgrounds.dart';

class RectangleRainPage extends StatefulWidget {
  @override
  _RectangleRainPageState createState() => _RectangleRainPageState();
}

class _RectangleRainPageState extends State<RectangleRainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Builder(
      builder: (context) {
        return Container(
          child: Stack(children: [
            Positioned(
              top: 0,
              left: 0,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Container(
                color: Colors.lightBlue,
              ),
            ),
            RectangleRain(
              colors: [Colors.white.withAlpha(160)],
              // dotColor: Colors.white,
              // lineColor: Colors.amber,
              // bgColor: Colors.pink
            ),
            Align(
              alignment: Alignment.topCenter,
              child: ClipPath(
                clipper: MyClipper(),
                child: Container(
                  color: Colors.white,
                  height: 250,
                ),
              ),
            ),
            Positioned(
              top: 100,
              left: (MediaQuery.of(context).size.width / 2) - 90,
              child: Image.asset(
                'images/logo.png',
                height: 180,
              ),
            ),
            loginForm()
          ]),
        );
      },
    ));
  }

  loginForm() {
    Color textFieldBorderColor = Colors.white;

    return Positioned(
      top: 180,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 90, left: 40, right: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 100),
                  SizedBox(
                    height: 50,
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: TextStyle(color: textFieldBorderColor),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: textFieldBorderColor, width: 2.0, style: BorderStyle.solid))),
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 50,
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(color: textFieldBorderColor),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: textFieldBorderColor, width: 2.0, style: BorderStyle.solid))),
                    ),
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
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.5);
    // path.quadraticBezierTo(size.width * 0.25, size.height * 0.55, size.width / 2, size.height * 0.75);
    path.quadraticBezierTo(size.width * 0.6, size.height, 0, size.height * 0.7);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    true;
  }
}
