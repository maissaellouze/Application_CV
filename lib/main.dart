import 'package:cv_maissa/pages/CentreInteret.page.dart';
import 'package:cv_maissa/pages/MoreDetails.page.dart';
import 'package:cv_maissa/pages/VieAssciative.page.dart';
import 'package:cv_maissa/pages/experience.page.dart';
import 'package:cv_maissa/pages/formationpage.dart';
import 'package:cv_maissa/pages/langage.competence.page.dart';
import 'package:cv_maissa/pages/projets.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';

import 'package:theme_provider/theme_provider.dart';


import 'composant/theme_service.dart';
import 'localisation/locales.dart';
import 'pages/home.page.dart';


void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final routes = {
    '/home': (context) => HomePage(),
    '/Formation': (context) => FormationPage(),
    '/Projets': (context) => Projets(),
    '/Experience': (context) => Experience(),
    '/MoreDetails': (context) => MoreDetails(),
    '/LangageCompetence': (context) => LangageCompetence(),
    '/VieAssciative': (context) => VieAssciative(),
    '/CentreInteret': (context) => CentreInteret(),
  };

  final FlutterLocalization localization = FlutterLocalization.instance;

  @override
  void initState() {
    super.initState();
    configureLocalization();
  }

  @override
  Widget build(BuildContext context) {
    // Retrieve the stored theme value from GetStorage
    String? storedTheme = GetStorage().read<String>('theme');
    // Set the theme based on the stored value
    ThemeService().setThemeMode(storedTheme);

    return ThemeProvider(
      loadThemeOnInit: true,
      child: Builder(
        builder: (context) {
          // Wrap MaterialApp with Builder to get the correct context
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeService().lightTheme,
            darkTheme: ThemeService().darkTheme,
            themeMode: ThemeService().getThemeMode(),
            routes: routes,
            supportedLocales: localization.supportedLocales,
            localizationsDelegates: localization.localizationsDelegates,
            home: SplashScreen(),
          );
        },
      ),
    );
  }

  void configureLocalization() {
    localization.init(mapLocales: LOCALES, initLanguageCode: "fr");
    localization.onTranslatedLanguage = onTranslatedLanguage;
  }

  void onTranslatedLanguage(Locale? locale) {
    setState(() {});
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Delay for 2 seconds and then navigate to the home page
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/home');
    });

    return Scaffold(
      body: Center(
        child: Lottie.network(
          'https://lottie.host/758a11c7-ecbe-4b6a-ba0c-2204cd258986/5QTvlne6B7.json',
        ),
      ),
    );
  }
}
