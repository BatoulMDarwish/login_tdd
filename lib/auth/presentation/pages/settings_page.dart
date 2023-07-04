import 'package:alpha_tdd/core/localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/localization/controller/cubit/locale_cubit.dart';
import '../../../core/utils/app_color.dart';


class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColor.pink,
        title: Text("settings".tr(context)),
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: BlocConsumer<LocaleCubit, ChangeLocaleState>(
                  listener: (context, state) {

                  },
                  builder: (context, state) {
                    return DropdownButton<String>(
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
                          context.read<LocaleCubit>().changeLanguage(newValue);
                        }
                        Navigator.pushNamed(context, '/welcome');
                      },
                    );
                  },
                )),
          ),
          ElevatedButton(onPressed: (){Navigator.pushNamed(context, '/welcome');}, child: Text("skip".tr(context)))
        ],
      ),
    );
  }
}
