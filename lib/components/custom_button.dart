import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final Color? color, backColor;
  final double? fontSize;
  const CustomButton(
      {Key? key,
      this.text = '',this.onPressed,
      this.color = Colors.white, this.fontSize = 15, this.backColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // color: backColor,
          padding: const EdgeInsets.all(15),
          decoration: ShapeDecoration(
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
          child: ElevatedButton(
            onPressed: onPressed,
            child: Text(text,
              style: TextStyle(color: color,fontSize: fontSize),
            ),
          ),
        ),
        const SizedBox(height: 15,),
      ],
    );
  }
}