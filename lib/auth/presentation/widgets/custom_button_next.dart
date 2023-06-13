import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/app_color.dart';

class CustomButtonNext extends StatelessWidget{
  final IconData icons;
  final Color colorIcon;
  final Color colorbutton;
  final Function() onTap;
  const CustomButtonNext({Key? key, required this.colorIcon, required this.colorbutton, required this.onTap, required this.icons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RSizedBox(
      width: 68,
      height: 59,
      child: MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          onPressed: onTap,
          color: colorbutton,
          child:Icon(
            icons,
            color: colorIcon,
          )
      ),

    );
  }
}