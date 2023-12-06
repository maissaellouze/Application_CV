import 'dart:ui';

import 'package:cv_maissa/pages/map.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../localisation/locales.dart';
import 'PdfViewPage.dart';

class MoreDetails extends StatefulWidget {
  const MoreDetails({Key? key}) : super(key: key);

  @override
  _MoreDetailsState createState() => _MoreDetailsState();
}

class _MoreDetailsState extends State<MoreDetails> {
  final String address = "QQ4C+VVJ ISET Sfax, Sfax";
  final String email = "maissaellouze02@gmail.com";
  final String phoneNumber = "+216 29 093 786";
  final String githubUrl = "https://github.com/maissaellouze";

  void launchEmail() async {
    final url = 'mailto:$email';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void launchPhone() async {
    final url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void launchMaps() async {
    final url = 'https://www.google.com/maps/search/?api=1&query=$address';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.asset("images/maissa.jpg"),
            ),
            buttonArrow(context),
            scroll(),
          ],
        ),
      ),
    );
  }

  Widget buttonArrow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          clipBehavior: Clip.hardEdge,
          height: 55,
          width: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget scroll() {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      maxChildSize: 1.0,
      minChildSize: 0.6,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(20),
              topRight: const Radius.circular(20),
            ),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 5,
                        width: 35,
                        color: Colors.black12,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    InkWell(
                      child: const CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage("images/maissa.jpg"),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Maissa ELLOUZE",
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Divider(
                    height: 4,
                  ),
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: const Color(0xFFE3FFF8),
                      child: Icon(
                        Icons.done,
                        size: 20,
                        color: Colors.teal,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      LocaleData.desc1.getString(context),
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: const Color(0xFFE3FFF8),
                      child: Icon(
                        Icons.done,
                        size: 20,
                        color: Colors.teal,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      LocaleData.desc2.getString(context),
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  LocaleData.texte.getString(context),
                  style: TextStyle(
                    fontSize: 15.0,
                    color: const Color(0xFF0047AB),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Divider(
                    height: 8,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        launchEmail();
                      },
                      child: Icon(
                        Icons.mail,
                        size: 30,
                        color: const Color(0xFF0047AB),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        launchPhone();
                      },
                      child: Icon(
                        Icons.phone,
                        size: 30,
                        color: const Color(0xFF0047AB),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        launchUrl(githubUrl);
                      },
                      child: FaIcon(
                        FontAwesomeIcons.github,
                        size: 30,
                        color: const Color(0xFF0047AB),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        launchMaps();
                      },
                      child: Icon(
                        Icons.location_on,
                        size: 30,
                        color: const Color(0xFF0047AB),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 20.0), // Add space above the button
                      child: ElevatedButton(
                        onPressed: () {
                          // Show the PDF in a modal bottom sheet
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                height: 2000,
                                child: SfPdfViewer.asset(
                                  "assets/pdf/cv.pdf",
                                ),
                              );
                            },
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          // Add your custom button styles here
                          primary: Color(0xFF0047AB), // Background color
                          textStyle: TextStyle(
                            fontSize: 16.0, // Text size
                            fontWeight: FontWeight.bold, // Text weight
                          ),
                        ),
                        child: Text('Afficher PDF'),
                      ),
                    )

                  ],
                ),

                const SizedBox(
                  height: 10,
                ),



              ],


            ),

          ),
        );

      },

    );
  }
}


