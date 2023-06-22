import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth/presentation/manager/auth_bloc.dart';
import 'auth/presentation/pages/home.dart';
import 'auth/presentation/pages/sign_in_screen.dart';
import 'auth/presentation/pages/splash_screen.dart';
import 'auth/presentation/pages/welcom_screen.dart';
import 'core/network/post.dart';
import'core/services/services_locator.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) =>
          BlocProvider(
            create: (context) =>sl<AuthBloc>(),
           child:
      MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  fontFamily: 'Poppins'
              ),

             initialRoute: "/",
              routes: {
                "/": (context) => const SplashScreen(),
                "/welcome": (context) => const WelcomeScreen(),
                "/signIn": (context) => SignInScreen(),
                "/home": (context) => HomeScreen(),
              }
            ),
          )

    );
  }
}



