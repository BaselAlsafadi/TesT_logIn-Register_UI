import 'package:flutter/material.dart';
import 'package:flutter_app/widget/stars.dart';

class SingleStar extends StatelessWidget {
  const SingleStar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 7,
      child: SizedBox(
        height: 15,
        width: 15,
        child: ClipPath(
          clipper: StarClipper(5),
          child: Container(
            height: 300,
            color: Colors.amber,
          ),
        ),
      ),
    );
  }
}
