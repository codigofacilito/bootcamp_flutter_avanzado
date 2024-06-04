import 'dart:ui';

import 'package:flutter/material.dart';

class CourseModel{
  int id;
  String title;
  String description;
  String image;
  String heroTag;
  Color color;
  CourseModel({this.id=0,this.title="",this.description="",this.image="",this.heroTag="",this.color=Colors.white});


  static List<CourseModel> get courses => [
    CourseModel(
        id: 1,
        title: "Dart",
        description:
        "Dart es un lenguaje de programación de código abierto, desarrollado por Google.",
        image: "https://i.postimg.cc/m1j1PLY1/Dart-logo.png",
        color: Colors.yellowAccent,
        heroTag: UniqueKey().toString()),
    CourseModel(
        id: 2,
        title: "PHP",
        description:
        "PHP es un lenguaje de programación interpretado​ del lado del servidor y de uso general que se adapta especialmente al desarrollo web.​ Fue creado inicialmente por el programador danés-canadiense Rasmus Lerdorf en 1994.​ ",
        image: "https://i.postimg.cc/xNnbjJzS/php-logo.png",
        color: Colors.blueAccent,
        heroTag: UniqueKey().toString()),
    CourseModel(
        id: 3,
        title: "Python",
        description:
        "Python es un lenguaje de alto nivel de programación interpretado cuya filosofía hace hincapié en la legibilidad de su código. ",
        image: "https://i.postimg.cc/K429307m/Python-Emblem.png",
        color: Colors.purpleAccent,
        heroTag: UniqueKey().toString())
  ];
}