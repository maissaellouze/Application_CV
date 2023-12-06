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

class Projets extends StatefulWidget {
  const Projets({Key? key}) : super(key: key);

  @override
  State<Projets> createState() => _ProjetsState();
}

class _ProjetsState extends State<Projets> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final PageController _pageController = PageController(); // Move _pageController here

    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          LocaleData.option2.getString(context), // Add your desired title
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
          CustomPaint(
            painter: ArcPainter(),
            child: SizedBox(
              height: screenSize.height / 1.4,
              width: screenSize.width,
            ),
          ),
          Positioned(
            top: screenSize.height / 5 - 60,
            left: screenSize.width / 2 - 100,
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(tabs[_currentIndex].image),
                  radius: 100,
                ),
                SizedBox(height: 8),
                Icon(
                 Icons.abc,
                  color: Colors.white,
                  size: 30,
                ),
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
                            Text(
                              tab.title,
                              style: const TextStyle(
                                fontSize: 27.0,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(height: 50),
                            Text(
                              tab.subtitle,
                              style: const TextStyle(
                                fontSize: 17.0,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            )
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
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (int index = 0; index < tabs.length; index++)
                        _DotIndicator(isSelected: index == _currentIndex),
                    ],
                  ),
                  const SizedBox(height: 95)
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_currentIndex == tabs.length - 1) {
            _pageController.animateToPage(
              0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.linear,
            );
          } else {
            _pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.linear,
            );
          }
        },
        child: const Icon(CupertinoIcons.chevron_right, color: Colors.white),
        backgroundColor: Colors.transparent,
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

class _DotIndicator extends StatelessWidget {
  final bool isSelected;

  const _DotIndicator({Key? key, required this.isSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 6.0),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 6.0,
        width: 6.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? Colors.white : Colors.white38,
        ),
      ),
    );
  }
}

class OnboardingModel {
  final String image;
  final String title;
  final String subtitle;

  OnboardingModel(this.image, this.title, this.subtitle);
}

List<OnboardingModel> tabs = [
  OnboardingModel(
    'images/django.jpg',
    'site web « ArtyProd »',
    'Conception et réalisation d’un site web « ArtyProd »pour une agence qui expose aux internautes ses différents services codés en framework Python (Django)',
  ),
  OnboardingModel(
    'images/rn.jpg',
    'Site web « Pharmacie »',
    'Conception et réalisation d’un Système de gestion d’une paraPharmacie pour commander des produits du site codé en framework Node et React',
  ),
];
