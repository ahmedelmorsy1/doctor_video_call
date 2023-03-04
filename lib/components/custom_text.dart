import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight? fWeight;
  final Color color;
  final TextAlign? tAlign;  
  const CustomText(
      {Key? key,this.text ="",this.fontSize = 18,
      this.color =Colors.black, this.tAlign, this.fWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Text(text,
          style: TextStyle(color: color,fontSize: fontSize,fontWeight:fWeight),
          textAlign: tAlign,),
          const SizedBox(height: 10,),
        ],
      ),
    );
  }
}