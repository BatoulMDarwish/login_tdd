import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/app_color.dart';

class CustomButton extends StatelessWidget{
  final Color colorText;
  final Color colorbutton;
  final String text;
  final Function() onTap;
  const CustomButton({Key? key, required this.colorText, required this.colorbutton, required this.text, required this.onTap,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RSizedBox(
      width: 361,
      height:59,
      child: MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          onPressed: onTap,
          color: colorbutton,
            child:Text(
              text,
              textAlign:TextAlign.center ,
              style: TextStyle(
                color: colorText,
                fontSize: 17.sp,
              ),
            )
    ),

    );
  }
}