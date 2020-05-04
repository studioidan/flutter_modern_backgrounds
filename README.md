# Flutter modern backgrounds


<table>
  <tr>
    <td></td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td>Particles</td>
    <td><img src="https://github.com/studioidan/flutter_modern_backgrounds/blob/master/art/particles1.gif" width=270 height=480></td>
    <td><img src="https://github.com/studioidan/flutter_modern_backgrounds/blob/master/art/particles2.gif" width=270 height=480></td>
  </tr>
  <tr>
    <td>Rectangle Rain</td>
    <td><img src="https://github.com/studioidan/flutter_modern_backgrounds/blob/master/art/rectangle-rain2.gif" width=270 height=480></td>
    <td><img src="https://github.com/studioidan/flutter_modern_backgrounds/blob/master/art/rectangle-rain1.gif" width=270 height=480></td>
  </tr>
 </table>
#### Particles


### Install

Add this line to pubspec.yaml

```
dependencies:
     flutter_modern_backgrounds: ^0.0.2
```


### Import
```
import 'package:flutter_modern_backgrounds/flutter_modern_backgrounds.dart';

```

### Usage

## Particles
```
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Particles(
             dotColor: Colors.white,   // optional
             lineColor: Colors.amber, // optional
             bgColor:   Colors.grey   // optional
             size: Size(400, 400),     // optional
            ),
      ),
    );
  }
}
```

## Rectangle Rain
```
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: RectangleRain(
              colors: [Colors.white, Colors.pink, Colors.yellowAccent, Colors.blueGrey],
            ),
      ),
    );
  }
}
```

