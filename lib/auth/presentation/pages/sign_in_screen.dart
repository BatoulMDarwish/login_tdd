import 'package:alpha_tdd/auth/presentation/widgets/toast_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_string.dart';
import '../manager/auth_bloc.dart';
import '../widgets/custom_background_image.dart';
import '../widgets/custom_button_next.dart';
import '../widgets/custom_button_widget.dart';
import '../widgets/custom_text_filed.dart';
import '../widgets/custom_text_widget.dart';


class SignInScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  TextEditingController dialCodeController = TextEditingController();
  TextEditingController numberPhoneController = TextEditingController();

  SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
       if(state is LoginSuccessState){
         Navigator.pushNamed(context, "/home");
       }
       // if(state is ErrorLoginState){
       //  showToast(text: state.message, state: ToastStates.ERROR);
       // }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColor.white,
          body: Stack(
            children: [
              const CustomBackground(),
              Padding(
                padding: REdgeInsetsDirectional.only(start: 33.w, end: 33.w),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const Spacer(),
                      Image.asset(
                        'assets/images/signin.jpg',

                      ),
                      const Spacer(),
                      CustomTextForm(
                          hinttext: AppString.DialCode,
                          isNumber: true,
                          mycontroller: dialCodeController,
                          valid: (String? value) {
                            if (value!.isEmpty) {
                              return 'please enter your dialCode';
                            }
                            return null;
                          }
                      ),
                      18.verticalSpace,
                      CustomTextForm(
                        hinttext: AppString.PhoneNumber,
                        isNumber: true,
                        mycontroller: numberPhoneController,
                        valid: (String? value) {
                          if (value!.isEmpty) {
                            return 'please enter your phone number';
                          }
                          return null;
                        },
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: CustomButtonNext(
                              colorIcon: AppColor.pink,
                              colorbutton: AppColor.gray,
                              icons: Icons.arrow_back_ios_new_sharp,
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          8.horizontalSpace,
                          Visibility(
                            replacement: Flexible(
                              flex: 4,
                              child: CustomButton(
                                colorText: AppColor.white,
                                colorbutton: AppColor.pink,
                                text: AppString.Next,
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    context.read<AuthBloc>().add(LoginEvent(
                                            numberPhoneController.text.toString(),
                                            dialCodeController.text.toString()
                                        ));
                                    //
                                  }
                                },
                              ),
                            ),
                            visible: state is LoadingLoginState,
                            child: const Center(
                                child: CircularProgressIndicator(
                                  color: AppColor.pink,
                                )),
                          ),

                        ],
                      ),
                      17.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CustomText(
                              text: 'Don\'t have account ?',
                              color: AppColor.gray2,
                              size: 17),
                          8.horizontalSpace,
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, "/signUp");
                            },
                            child: const CustomText(
                                text: AppString.SignUp,
                                color: AppColor.pink,
                                size: 17),
                          ),


                        ],
                      ),
                      const Spacer()
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

}