// Copyright © AK2000YY, 2024. All rights reserved.
// Unauthorized copying of this file, via any medium, is strictly prohibited

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:naruto_app/business_logic/language/language_bloc.dart';
import 'package:naruto_app/core/localization/localization.dart';
import 'package:naruto_app/view/screen/introduce_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create:(_) => LanguageBloc()..add(const LanguageStarted()))
        ],
        child: BlocBuilder<LanguageBloc, LanguageState>(
            builder: (context, state) =>
                MaterialApp(
                  title: 'Flutter Demo',
                  debugShowCheckedModeBanner: false,
                  locale: state.languageCode != null ? Locale(state.languageCode!) : null,
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
                  theme: ThemeData(
                    colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
                    useMaterial3: true,
                  ),
                  home: const IntroduceScreen(),
                )
        )
    );
  }
}