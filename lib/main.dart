import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islamy_app/providers/settings_provider.dart';
import 'package:islamy_app/sura_details/sura_details_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'home/home_screen.dart';
import 'my_theme.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (buildContext)=>SettingsProvider(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return MaterialApp(
        theme: MyTheme.lightTheme,
        darkTheme: MyTheme.darkTheme,
        themeMode: settingsProvider.currentTheme,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,

      locale: Locale(settingsProvider.currentLang),
      routes: {
        HomeScreen.routName: (_) => HomeScreen(),
        SuraDetailsScreen.routName: (_) => SuraDetailsScreen(),
      },
      initialRoute: HomeScreen.routName,
    );
  }
}
