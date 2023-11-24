import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/lang/translation_service.dart';
import 'core/ui/ui_config.dart';

class AppProd extends StatefulWidget {
  const AppProd({Key? key}) : super(key: key);

  @override
  State<AppProd> createState() => _AppProdState();
}

class _AppProdState extends State<AppProd> {
  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/');
    Modular.setObservers([Asuka.asukaHeroController]);

    return LayoutBuilder(
      builder: ((context, constraints) {
        return OrientationBuilder(builder: (context, orientation) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Test Target',
            theme: UiConfig.theme,
            locale: TranslationService.locale,
            supportedLocales: const [
              Locale('pt', 'BR'),
              Locale('es', 'ES'),
              Locale('en', 'US')
            ],
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            ],
            builder: Asuka.builder,
            localeResolutionCallback: (locale, supportedLocales) {
              if (locale == null) return supportedLocales.first;
              for (Locale supportedLocale in supportedLocales) {
                if (supportedLocale.languageCode == locale.languageCode ||
                    supportedLocale.countryCode == locale.countryCode) {
                  return supportedLocale;
                }
              }
              return supportedLocales.first;
            },
            routeInformationParser: Modular.routeInformationParser,
            routerDelegate: Modular.routerDelegate,
          );
        });
      }),
    );
  }
}
