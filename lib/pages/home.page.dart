

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:url_launcher/url_launcher.dart';
import '../composant/Opaque.Image.dart';
import '../composant/Profile.Info.BigCard.dart';
import '../composant/info.dart';
import '../composant/theme_service.dart';
import '../localisation/locales.dart';
import '../menu/drawer.widget.dart';
import '../style/text.style.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _switch =false;
  ThemeData _dark=ThemeData(brightness: Brightness.dark);
  ThemeData _light=ThemeData(brightness: Brightness.light);
  late FlutterLocalization _flutterLocalization;
  late String _currentLocale;

  @override
  void initState() {
    super.initState();
    _flutterLocalization = FlutterLocalization.instance;
    _currentLocale = _flutterLocalization.currentLocale!.languageCode;
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    const moonIcon = CupertinoIcons.moon_stars;
    return Scaffold(

      drawer: MyDrawer(),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Stack(
                  children: <Widget>[
                    OpaqueImage(
                      imageUrl: "images/maissa.jpg",
                    ),
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "CV",
                                    style: headingTextStyle,
                                  ),
                                  MyInfo(),
                                ],
                              ),
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: IconButton(
                                icon: const Icon(
                                  moonIcon,
                                  color: Colors.grey,
                                ), // Icon
                                onPressed: () {
                                  print("change");
                                  setState(() {
                                    ThemeService().changeTheme();
                                    print(ThemeService().isSavedDarkMode());
                                  });
                                },
                              ), // IconButton
                            ),

                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 6,
                child: Container(
                  padding: const EdgeInsets.only(top: 40),
                  color: Colors.white,
                  child: SingleChildScrollView(
                    child: Table(
                      children: [
                        TableRow(
                          children: [
                            ProfileInfoBigCard(
                              firstText: LocaleData.option1.getString(context),

                              icon: Icon(
                                Icons.lightbulb,
                                size: 32,
                                color: Color(0xFF0047AB),
                              ),
                              onTap: () {
                                Navigator.pushNamed(context, "/Formation");
                              },
                            ),
                            ProfileInfoBigCard(
                              firstText: LocaleData.option2.getString(context),
                              icon: Icon(
                                Icons.code,
                                size: 32,
                                color: Color(0xFF0047AB),
                              ),
                              onTap: () {
                                Navigator.pushNamed(context, "/Projets");
                              },
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            ProfileInfoBigCard(
                              firstText: LocaleData.option3.getString(context),
                              icon: Icon(
                                Icons.business,
                                size: 32,
                                color: Color(0xFF0047AB),
                              ),
                              onTap: () {
                                Navigator.pushNamed(context, "/Experience");
                              },
                            ),
                            ProfileInfoBigCard(
                              firstText: LocaleData.option4.getString(context),
                              icon: Icon(
                                Icons.build,
                                size: 32,
                                color: Color(0xFF0047AB),
                              ),
                              onTap: () {
                                Navigator.pushNamed(context, "/LangageCompetence");
                              },
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            ProfileInfoBigCard(
                              firstText: LocaleData.option5.getString(context),
                              icon: Icon(
                                Icons.support,
                                size: 32,
                                color: Color(0xFF0047AB),
                              ),
                              onTap: () {
                                Navigator.pushNamed(context, "/VieAssciative");
                              },
                            ),
                            ProfileInfoBigCard(
                              firstText: LocaleData.option6.getString(context),
                              icon: Icon(
                                Icons.category,
                                size: 32,
                                color: Color(0xFF0047AB),
                              ),
                              onTap: () {
                                Navigator.pushNamed(context, "/CentreInteret");
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: screenHeight * (4 / 10) - 0 / 4,
            left: 20,
            right: 16,
            child: Container(
              height: 50,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      launchMail();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.mail,
                          color: Colors.black54,
                          size: 20,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'maissaellouze02@gmail.com',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.black54,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      launchPhone();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.phone,
                          color: Colors.black54,
                          size: 20,
                        ),
                        SizedBox(width: 8),
                        Text.rich(
                          TextSpan(

                            children: [
                              TextSpan(
                                text: '+216 29 093 786 ',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.black54,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () {
                _showLanguageDialog(context);
              },
              child: Container(
                padding: EdgeInsets.all(8),
                child: Text(
                  'Voulez-vous modifier la langue ?',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                    decoration: TextDecoration.underline,
                  ),

                ),

              ),
            ),
          ),
        ],
      ),
    );
  }


  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Choisir la langue'),
          content: DropdownButton(
            value: _currentLocale,
            items: const [
              DropdownMenuItem(
                value: "fr",
                child: Text("Français"),
              ),
              DropdownMenuItem(
                value: "en",
                child: Text("Englais"),
              ),
              DropdownMenuItem(
                value: "es",
                child: Text("Espagnol"),
              ),
            ],
            onChanged: (value) {
              print(value);
              _setLocale(value);
              Navigator.of(context).pop(); // Close the dialog after selecting a language
            },
          ),
        );
      },
    );
  }
  void _setLocale(String? value) {
    if (value == null) return;
    if (value == "fr") {
      _flutterLocalization.translate("fr");
    } else if (value == "en") {
      _flutterLocalization.translate("en");
    } else if (value == "es") {
      _flutterLocalization.translate("es");
    } else {
      return;
    }
    setState(() {
      _currentLocale = value;
    });
  }
}




launchMail() async {
  final Uri _emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'maissaellouze02@gmail.com',
  );

  if (await canLaunch(_emailLaunchUri.toString())) {
    await launch(_emailLaunchUri.toString());
  } else {
    throw 'Could not launch email';
  }
}
void launchPhone() async {
  const phoneNumber = '1234567890';
  final url = 'tel:$phoneNumber';

  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Impossible de lancer l\'appel téléphonique';
  }
}

