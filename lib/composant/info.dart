import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import '../localisation/locales.dart';
import '../pages/Plus.Info.Page.dart';
import '../style/text.style.dart';

class MyInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 7.0),
              child: CircleAvatar(
                backgroundImage: AssetImage("images/maissa.jpg"),
                radius: 60,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "               Maissa ELLOUZE",
                  style: whiteNameTextStyle,
                ),
                SizedBox(width: 10),
                Text(
                  "  ",
                  style: whiteNameTextStyle,
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    // Navigate to the PlusInfoPage screen on icon tap
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PlusInfoPage()),
                    );
                  },
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "/MoreDetails");
                        },
                        child: Icon(
                          Icons.info,
                          color: Colors.black54,
                          size: 30,
                          semanticLabel: 'More Info', // Provide a semantic label for accessibility
                        ),
                      ),


                      SizedBox(width: 5),
                      Text(
                        "",
                        style: TextStyle(
                          color: Color(0xFF0047AB),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  LocaleData.desc1.getString(context),
                  style: whiteSubHeadingTextStyle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
