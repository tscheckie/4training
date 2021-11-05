import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:for_training/res/custom_colors.dart';
import 'package:for_training/screens/home.dart';
import 'package:for_training/screens/page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: CustomColors.darkRed,
        textTheme: const TextTheme(
            headline1: TextStyle(fontSize: 30.0),
            headline2: TextStyle(fontSize: 25.0, height: 3),
            headline3: TextStyle(fontSize: 20.0, height: 3)),
      ),
      initialRoute: MyHomePage.routeName,
      routes: {
        MyHomePage.routeName: (context) => const MyHomePage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == ContentPage.routeName) {
          final Map args = settings.arguments as Map;
          return MaterialPageRoute(builder: (context) {
            return ContentPage(page: args['page']);
          });
        }
      },
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
        Locale('de', ''), // German, no country code
      ],
    );
  }
}
