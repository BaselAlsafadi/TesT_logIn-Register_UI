import 'package:flutter/material.dart';

class LineUnderButton extends StatelessWidget {
  final String lable1;
  final String lable2;
  final Function() ontap;

  const LineUnderButton({
    Key? key,
    required this.lable1,
    required this.lable2,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          lable1,
          style: const TextStyle(
              fontSize: 12,
              color: Color(0xff6C757D),
              fontWeight: FontWeight.bold),
        ),
        InkWell(
          onTap: ontap,
          child: Text(
            lable2,
            style: const TextStyle(
                decoration: TextDecoration.underline,
                fontStyle: FontStyle.italic,
                fontSize: 12,
                color: Colors.brown,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
