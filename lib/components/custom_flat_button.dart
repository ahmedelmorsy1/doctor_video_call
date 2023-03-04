import 'package:flutter/material.dart';

class CustomFlatButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final Color color;
  final double fontSize;
  const CustomFlatButton(
      {Key? key,
      this.text = '',
      required this.onPressed,
      this.color = Colors.white,
      this.fontSize = 15})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(color: color, fontSize: fontSize),
      ),
    );
  }
}
