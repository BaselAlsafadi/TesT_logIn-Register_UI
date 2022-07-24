// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

class WellcomMessage extends StatelessWidget {
  final String title;
  final String body1;
  final String body2;
  const WellcomMessage({
    Key? key,
    required this.title,
    required this.body1,
    required this.body2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(color: Colors.black, fontSize: 22),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                body1,
                style: const TextStyle(color: Color(0xff6C757D), fontSize: 16),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                body2,
                style: const TextStyle(color: Color(0xff6C757D), fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
