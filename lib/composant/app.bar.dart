import 'package:flutter/material.dart';

class AppBar extends StatelessWidget  {
  final Widget leading, trailing;

  AppBar({Key? key, required this.leading, required this.trailing}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          bottom: 16,
        ),
        child: Row(
          children: <Widget>[
            leading,
            Spacer(),
            trailing,
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(40);
}