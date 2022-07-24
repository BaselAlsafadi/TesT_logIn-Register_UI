// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

class Dividers extends StatelessWidget {
  const Dividers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          alignment: Alignment.center,
          width: 100,
          child: const Divider(
            thickness: 1,
            color: Color(0xff6C757D),
          ),
        ),
        const Text(
          'Or Continue With',
          style: TextStyle(
              color: Color(0xff6C757D),
              fontWeight: FontWeight.bold,
              fontSize: 12),
        ),
        Container(
          width: 100,
          child: const Divider(
            thickness: 1,
            color: Color(0xff6C757D),
          ),
        ),
      ],
    );
  }
}
