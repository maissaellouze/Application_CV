import 'dart:math';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localization/flutter_localization.dart';

import '../localisation/locales.dart';

class CentreInteret extends StatefulWidget {
  const CentreInteret({Key? key}) : super(key: key);

  @override
  State<CentreInteret> createState() => _CentreInteret();
}

class _CentreInteret extends State<CentreInteret> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final PageController _pageController = PageController(); // Move _pageController here

    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black45.withOpacity(1),
      appBar: AppBar(
        title: Text(
          LocaleData.option6.getString(context), // Add your desired title
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
          const SizedBox(height: 40),
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


  OnboardingModel( this.title,this.image);
}

List<OnboardingModel> tabs = [
  OnboardingModel(

    'Musculation',
    'images/bp.jpg',

  ),
  OnboardingModel(

    'Club',
    'images/club.jpg',

  ),





];
