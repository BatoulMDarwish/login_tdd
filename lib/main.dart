import 'package:alpha_tdd/auth/presentation/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'auth/presentation/manager/auth_bloc.dart';
import 'auth/presentation/pages/home.dart';
import 'auth/presentation/pages/sign_in_screen.dart';
import 'auth/presentation/pages/splash_screen.dart';
import 'auth/presentation/pages/welcom_screen.dart';
import 'core/localization/app_localizations.dart';
import 'core/localization/controller/cubit/locale_cubit.dart';
import 'core/network/post.dart';
import'core/services/services_locator.dart';

void main() async {
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
          MultiBlocProvider(
            providers:
            [
              BlocProvider(
                create: (context) => sl<AuthBloc>(),),
              BlocProvider(
                create: (context) =>
                LocaleCubit()
                  ..getSavedLanguage(),
              ),
            ],
            child:
            BlocBuilder<LocaleCubit, ChangeLocaleState>(
              builder: (context, state) {
                return MaterialApp(
                    locale: state.locale,
                    supportedLocales: const [Locale('en'), Locale('ar')],
                    localizationsDelegates: const [
                      AppLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate
                    ],
                    localeResolutionCallback: (deviceLocale, supportedLocales) {
                      for (var locale in supportedLocales) {
                        if (deviceLocale != null &&
                            deviceLocale.languageCode == locale.languageCode) {
                          return deviceLocale;
                        }
                      }

                      return supportedLocales.first;
                    },
                    debugShowCheckedModeBanner: false,
                    theme: ThemeData(
                        fontFamily: 'Poppins'
                    ),

                    initialRoute: "/",
                    routes: {
                      "/": (context) => const SettingsPage(),
                      "/welcome": (context) => const WelcomeScreen(),
                      "/signIn": (context) => SignInScreen(),
                      "/home": (context) => HomeScreen(),
                    }
                );
              },
            ),
          ),
    );


  }
}



