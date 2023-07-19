import 'package:alpha_tdd/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
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
                 text:LocaleKeys.Sign_in.tr(),
                 colorbutton: AppColor.pink,
                 colorText: AppColor.white,
                 onTap: (){
                   Navigator.pushNamed(context,"/signIn");
                 },
               ),
              20.verticalSpace,
               CustomButton(
                 text: LocaleKeys.create_account.tr(),
                 colorbutton: AppColor.gray,
                 colorText: AppColor.black,
                 onTap: (){},
               ),
              14.verticalSpace,
                CustomText(
                   text: LocaleKeys.continue_as_a_guest.tr(),
                   color: AppColor.gray2,
                   size:17
               )
             ],
           ),
         ),
    );
  }
}
