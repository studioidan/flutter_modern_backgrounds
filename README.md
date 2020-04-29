# Flutter modern backgrounds

<img src="https://github.com/studioidan/flutter_modern_backgrounds/blob/master/art/particles.gif" width="340px" />


### Install

Add this line to pubspec.yaml

```
dependencies:
     flutter_modern_backgrounds: ^0.0.1
```


### Import
```
import 'package:flutter_modern_backgrounds/flutter_modern_backgrounds.dart';

```

### Usage

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

