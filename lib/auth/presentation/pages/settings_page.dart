

import 'package:alpha_tdd/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/localization/controller/cubit/locale_cubit.dart';
import '../../../core/localization/controller/cubit/locale_state.dart';
import '../../../core/utils/app_color.dart';


class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit,ChangeLocaleState>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.pink,
          title: Text(LocaleKeys.Sign_in.tr()),
        ),
        body: Column(
          children: [
            Center(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:  DropdownButton<String>(
                        value: state.locale.languageCode,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: ['ar', 'en'].map((String items) {
                          return DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                              print(newValue);
                           // context.read<LocaleCubit>().changeLanguage(newValue);
context.setLocale(Locale(newValue));
                          }
                          Navigator.pushNamed(context, '/welcome');
                        },


                  )),
            ),
            ElevatedButton(onPressed: (){Navigator.pushNamed(context, '/welcome');}, child: Text(LocaleKeys.skip.tr()))
          ],
        ),
      ),
    );
  }
}