
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:transition_flutter/hero_example/course_details_screen.dart';
import 'package:transition_flutter/hero_example/course_model.dart';
import 'package:transition_flutter/hero_example/courses_list_screen.dart';
import 'package:transition_flutter/navigation/route.dart';
import 'package:transition_flutter/transitions/transitions.dart';

import '../screens/screen1.dart';
import '../screens/screen2.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;
    switch(settings.name){
      case screen1:
        return MaterialPageRoute(builder: (_)=>Screen1());
      case screen2:
        //Transicion con el paquete page_transition
        return PageTransition(type: PageTransitionType.rightToLeft,child: Screen2());
      case coursesScreen:
        return MaterialPageRoute(builder: (_)=>CoursesListScreen());
      case courseDetailsScreen:
        //Transiciones usando PageRouteBuilder
        return TransitionsExample.fadeRoute(CourseDetailsScreen(args as CourseModel));
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute(){
    return MaterialPageRoute(builder: (_){
      return Scaffold(
        body: const Center(
          child: const  Text(
            "error!! No se encontro la ventana"
          ),
        ),
      );
    });
  }
}