import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/global.params.dart';


class MyDrawer extends StatelessWidget{
  late SharedPreferences prefs;

  Widget build (BuildContext context){
    return Drawer(

        child: ListView(
          children: [
            DrawerHeader(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [Colors.white,Colors.teal])
                ),
                child: Center(
                  child: CircleAvatar(
                    backgroundImage: AssetImage("images/maissa.jpg"),
                    radius: 80,
                  ),
                )),
            ...(GlobalParams.menus as List).map((item){
              return Column(
                children: [
                  ListTile(
                    title: Text('${item['title']}',
                      style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,),
                    ),
                    leading: item['icon'],
                    trailing: Icon(Icons.arrow_right,color: Colors.teal),
                    onTap: () async {
                      if ('${item['title']}'!="déconnexion"){
                        Navigator.pop(context);
                        Navigator.pushNamed(context, "${item['route']}");
                      }else{
                        prefs=await SharedPreferences.getInstance();
                        prefs.setBool("connecte", false);
                        Navigator.pushNamedAndRemoveUntil(context, '/authentification ', (route) => false);
                      }
                    },
                  ),
                  Divider(height: 4,color: Colors.teal)
                ],
              );
            }),


          ],
        )
    );
  }
}