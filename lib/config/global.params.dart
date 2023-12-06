import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GlobalParams{
  static List<Map<String,dynamic>>menus=[
    {"title":"accueil","icon": Icon(Icons.home,color: Colors.teal),"route":"/home"}
    ,

    {"title":"meteo","icon": Icon(Icons.sunny,color: Colors.teal),"route":"/meteo"}
    ,

    {"title":"gallerie","icon": Icon(Icons.photo,color: Colors.teal),"route":"/gallerie"}
    ,

    {"title":"pays","icon": Icon(Icons.location_city,color: Colors.teal),"route":"/pays"}
    ,

    {"title":"contact","icon": Icon(Icons.contact_page,color: Colors.teal),"route":"/contact"}
    ,

    {"title":"parametres","icon": Icon(Icons.settings,color: Colors.teal),"route":"/parametre"}
    ,

    {"title":"deconnexion","icon": Icon(Icons.logout,color: Colors.teal),"route":"/authentification"}
    ,


  ];
  static List <Map<String,dynamic>>accueil=[
    { "title":"meteo","image": AssetImage('images/meteo.png'),"route":"/meteo"}
    ,
    { "title":"gallerie","image": AssetImage('images/gallerie.png'),"route":"/gallerie"}
    ,
    { "title":"pays","image": AssetImage('images/pays.png'),"route":"/pays"}
    ,
    { "title":"contact","image": AssetImage('images/contact.png'),"route":"/contact"}
    ,
    { "title":"parametres","image": AssetImage('images/parametres.png'),"route":"/parametre"}
    ,
    { "title":"deconnexion","image": AssetImage('images/deconnexion.png'),"route":"/authentification"}


  ];
}