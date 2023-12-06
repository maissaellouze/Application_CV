import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileInfoBigCard extends StatelessWidget {
  final String firstText;
  final Widget icon;
  final VoidCallback onTap;

  const ProfileInfoBigCard({
    Key? key,
    required this.firstText,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            top: 16,
            bottom: 24,
            right: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: icon,
              ),
              Text(
                firstText,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}