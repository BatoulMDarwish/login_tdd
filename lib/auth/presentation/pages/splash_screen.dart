import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_string.dart';
import '../widgets/custom_text_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
          ()=> Navigator.pushNamedAndRemoveUntil(
                  context, "/welcome", (route) => false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: AppColor.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
           Image.asset(
               'assets/images/splash.jpg',
           height: 700.h,
             width: 427.w,
           ),
            Column(
                children:  const [
                  CustomText(
                    color: AppColor.black,
                    size: 15,
                    text: AppString.PowerdBy,
                  ),
                  CustomText(
                    color: AppColor.black,
                    size: 15,
                    text: AppString.AssembledCompany,
                  )
                ],
              ),

          ],
        ),
      ),
    );
  }
}
