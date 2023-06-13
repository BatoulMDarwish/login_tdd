import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final FontWeight? weight;
  const CustomText({Key? key, required this.text, required this.color, required this.size, this.weight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Text(
      text,
      style:  TextStyle(
        color: color,
        fontSize: size.sp,
        fontWeight: weight,
      ),
    );
  }
}