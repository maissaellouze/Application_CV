import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
 // Import the necessary icon package
import 'package:url_launcher/url_launcher.dart';

import '../localisation/locales.dart';

var bannerItems = ["Licence en Technologie de l’informatique", "Diplome de baccalauréat "];
var bannertemps = ["2021 || present", "2017-- juin 2021" ];
var more = ["Institut superieur des étude technologique de sfax (ISET Sfax)", "Lycée Ibn Rachik ,Sfax" ];
var more2 = ["spécialisé en développement des systèmes d’information", "section Mathématique || Mention Bien " ];
var bannerImage = [
  "images/iset.jpg",
  "images/lir.jpg"

];

class FormationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;



    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleData.option1.getString(context), // Add your desired title
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontFamily: "Samantha",
          ),
        ),
        backgroundColor: Color(0xFF0047AB),
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
      body: Container(
        height: screenHeight,
        width: screenWidth,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                /*Padding(
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(icon: Icon(Icons.menu), onPressed: () {}),
                      Text(
                        "Formation",
                        style: TextStyle(fontSize: 50, fontFamily: "Samantha"),
                      ),
                      IconButton(icon: Icon(Icons.person), onPressed: () {})
                    ],
                  ),
                ),*/
                BannerWidgetArea(),

              ],
            ),

          ),
        ),
      ),

    );
  }
}

class BannerWidgetArea extends StatelessWidget {
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    PageController controller =
    PageController(viewportFraction: 0.8, initialPage: 1);

    List<Widget> banners = [];

    for (int x = 0; x < bannerItems.length; x++) {
      var bannerView = Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      offset: Offset(2.0, 2.0),
                      blurRadius: 5.0,
                      spreadRadius: 1.0,
                    ),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                child: Opacity(
                  opacity: 1,
                  child: Image.asset(
                    bannerImage[x], // Supprimez .withOpacity(0.85)
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black],
                  ),
                ),
              ),
              // Center the text in the middle of the image
              Positioned(
                bottom: 180, // Adjust this value as needed
                left: 20,
                right: 0,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        bannerItems[x],
                        style: TextStyle(fontSize: 25.0, color: Colors.white),
                      ),
                      Text(
                        bannerItems[x], // I assume this was a typo
                        style: TextStyle(fontSize: 12.0, color: Colors.white),
                      ),
                      SizedBox(height: 40),
                      // Add a button for text input
                      // Add a button for text input
                      ElevatedButton(

                        onPressed: () {
                          _showTextInputDialog(context, x);
                        },
                        child: Text(more[x],
                        style: TextStyle(color: Colors.black54),),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(300, 70),
                          backgroundColor: Colors.white70,// Adjust the width and height as needed
                        ),
                      ),

                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          _showTextInputDialog(context, x);
                        },
                        child: Text(more2[x],
                          style: TextStyle(color: Colors.black54),),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(300, 70),
                          backgroundColor: Colors.white70,// Adjust the width and height as needed
                        ),
                      ),

                    ],

                  ),


                ),
              ),
            ],
          ),
        ),
      );
      banners.add(bannerView);
    }

    return Container(
      width: 500,
      height: 550,
      child: PageView(
        controller: controller,
        children: banners,
      ),
    );
  }

  Future<void> _showTextInputDialog(BuildContext context, int index) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Enter Text'),
          content: TextField(
            controller: textEditingController,
            decoration: InputDecoration(hintText: 'Type something...'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Access the entered text using textEditingController.text
                print('Entered Text: ${textEditingController.text}');
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

