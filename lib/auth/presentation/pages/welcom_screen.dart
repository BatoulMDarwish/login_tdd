import 'package:alpha_tdd/core/localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_string.dart';
import '../../../core/utils/app_color.dart';
import '../widgets/custom_button_widget.dart';
import '../widgets/custom_text_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColor.white,
         body: Center(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Image.asset(
                 'assets/images/welcom.jpg',
                 height: 574.h,
                 width: 428.w,
               ),
               15.verticalSpace,
               CustomButton(
                 text:"Sign in".tr(context),
                 colorbutton: AppColor.pink,
                 colorText: AppColor.white,
                 onTap: (){
                   Navigator.pushNamed(context,"/signIn");
                 },
               ),
              20.verticalSpace,
               CustomButton(
                 text: "create account".tr(context),
                 colorbutton: AppColor.gray,
                 colorText: AppColor.black,
                 onTap: (){},
               ),
              14.verticalSpace,
                CustomText(
                   text: "continue as a guest".tr(context),
                   color: AppColor.gray2,
                   size:17
               )
             ],
           ),
         ),
    );
  }
}
