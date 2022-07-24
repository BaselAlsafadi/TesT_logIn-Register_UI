import 'package:flutter/material.dart';

class ForgotPasswordLine extends StatefulWidget {
  const ForgotPasswordLine({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordLine> createState() => _ForgotPasswordLineState();
}

class _ForgotPasswordLineState extends State<ForgotPasswordLine> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              // ignore: unnecessary_this
              value: this.value,
              onChanged: (bool? value) {
                setState(() {
                  this.value = value as bool;
                });
              },
            ),
            const Text(
              'Remember Me',
              style: TextStyle(color: Color(0xff6C757D), fontSize: 12),
            )
          ],
        ),
        const Text(
          'Forgot Password?',
          style: TextStyle(
              fontSize: 12,
              color: Colors.brown,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        )
      ],
    );
  }
}
