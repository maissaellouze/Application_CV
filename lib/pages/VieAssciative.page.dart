import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localization/flutter_localization.dart';

import '../localisation/locales.dart';

class VieAssciative extends StatefulWidget {
  const VieAssciative({Key? key}) : super(key: key);

  @override
  State<VieAssciative> createState() => _VieAssciative();
}

class _VieAssciative extends State<VieAssciative> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final PageController _pageController = PageController(); // Move _pageController here

    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black45.withOpacity(1),
      appBar: AppBar(
        title: Text(
          LocaleData.option5.getString(context), // Add your desired title
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontFamily: "Samantha",
          ),
        ),
        backgroundColor:  Color(0xFF0047AB),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            CupertinoIcons.chevron_left,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushNamed(context, "/home");
          },
        ),
      ),
      body: Stack(
        children: [
          const SizedBox(height: 30),
          CustomPaint(
            painter: ArcPainter(),
            child: SizedBox(
              height: screenSize.height / 1.4,
              width: screenSize.width,
            ),
          ),
          Positioned(

            width: screenSize.width,
            top: screenSize.height / 5 - 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Centre le contenu verticalement
              children: [
                const SizedBox(height: 30),
                ClipOval(
                  child: Image.asset(
                    alignment: Alignment.topCenter,
                    tabs[_currentIndex].image,
                    width: 200,  // Adjust the width as needed
                    height: 200, // Adjust the height as needed
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 30),

                Text(
                  tabs[_currentIndex].desc,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                // Ajoutez d'autres widgets à votre colonne si nécessaire
              ],
            ),
          ),



          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 270,
              child: Column(
                children: [
                  Flexible(

                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: tabs.length,
                      itemBuilder: (BuildContext context, int index) {
                        OnboardingModel tab = tabs[index];
                        return Column(

                          mainAxisSize: MainAxisSize.min,
                          children: [



                            SizedBox(height: 8),
                            const SizedBox(height: 80),
                            Text(
                              tab.title,
                              style: const TextStyle(
                                fontSize: 33.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            Text(
                              tab.duree,
                              style: const TextStyle(
                                fontSize: 33.0,
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.start,
                            ),



                          ],
                        );
                      },
                      onPageChanged: (value) {
                        setState(() {
                          _currentIndex = value;
                        });
                      },
                    ),
                  ),

                  const SizedBox(height: 95)
                ],
              ),
            ),
          ),
        ],
      ),

    );
  }
}

class ArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path orangeArc = Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height - 170)
      ..quadraticBezierTo(
          size.width / 2, size.height, size.width, size.height - 170)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(orangeArc, Paint()..color = Colors.teal);

    Path whiteArc = Path()
      ..moveTo(0.0, 0.0)
      ..lineTo(0.0, size.height - 185)
      ..quadraticBezierTo(
          size.width / 2, size.height - 70, size.width, size.height - 185)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(whiteArc, Paint()..color = Colors.white);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}



class OnboardingModel {
  final String desc;
  final String image;
  final String title;
  final String duree;


  OnboardingModel(this.desc, this.title, this.duree,this.image);
}

List<OnboardingModel> tabs = [
  OnboardingModel(
    ' Responsable des\n relations externes\n ',

    'club MTC',
    'Avril 2023 → Présent',
    'images/mtc.jpg',
  ),





];
