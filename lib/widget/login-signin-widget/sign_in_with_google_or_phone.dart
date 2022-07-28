import 'package:flutter/material.dart';

import 'circle_avatar.dart';

class SigninWithGoogleOrPhone extends StatelessWidget {
  const SigninWithGoogleOrPhone({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvataar(
          width: 20,
          height: 20,
          color: const Color(0xFFF6F7FF),
          image: Image.asset('assets/images/google.png'),
          radius: 20,
        ),
        // ignore: prefer_const_constructors
        SizedBox(
          width: 10,
        ),
        CircleAvataar(
          height: 20,
          width: 20,
          color: const Color(0xFFF6F7FF),
          image: Image.asset('assets/images/tell.png'),
          radius: 20,
        ),
      ],
    );
  }
}
