import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String lable;
  final Function() ontap;
  const Button({
    Key? key,
    required this.lable,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(lable),
      onPressed: ontap,
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          )),
          backgroundColor: MaterialStateProperty.all(Colors.brown),
          padding: MaterialStateProperty.all(const EdgeInsets.all(12)),
          textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 16))),
    );
  }
}
