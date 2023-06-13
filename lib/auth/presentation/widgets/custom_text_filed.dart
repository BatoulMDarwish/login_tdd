
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_color.dart';
class CustomTextForm extends StatelessWidget {
  final String hinttext;
  final IconData? iconData;
  final IconData? prefixIcon;
  final TextEditingController mycontroller;
  final String? Function(String?) valid;
  bool isNumber =false;
  final bool obscureText;
  final String? Function()? onTapIcon;
  final Function? suffixPressed;
  CustomTextForm({Key? key, required this.hinttext, this.iconData, required this.mycontroller, required this.valid, required this.isNumber,this.obscureText=false,this.onTapIcon, this.suffixPressed, this.prefixIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        obscureText:obscureText==null||obscureText==false?false:true ,
        keyboardType: isNumber?const TextInputType.numberWithOptions(decimal: true):TextInputType.text,
        validator:valid ,
        controller: mycontroller,
        decoration:  InputDecoration(
          filled: true,
            fillColor: AppColor.gray,
            hintText: hinttext,
            hintStyle: TextStyle(
              color: AppColor.gray2,
                fontSize: 17.sp
            ),
             contentPadding: EdgeInsets.symmetric(horizontal:12.h),
            suffixIcon: iconData != null
                ? IconButton(
              onPressed:(){
                suffixPressed!();
              },
                 icon: Icon(
                iconData,
              ),
            ) : null,
            prefixIcon: Icon(prefixIcon),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            )
        ),
      ),
    );
  }
}
