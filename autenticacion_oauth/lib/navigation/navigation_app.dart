
import 'package:autenticacion_oauth/navigation/route.dart';
import 'package:autenticacion_oauth/navigation/transitions.dart';
import 'package:autenticacion_oauth/view/home_screen.dart';
import 'package:autenticacion_oauth/view/login_screen.dart';
import 'package:autenticacion_oauth/view/slash_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;
    switch(settings.name){
      case splashScreen:
        return MaterialPageRoute(builder: (_)=>SplashScreen());
      case homeScreen:
        //Transicion con la clase creada en la clase anterior
        return TransitionsExample.fadeRoute(HomeScreen());
      case loginScreen:
      //Transicion con la clase creada en la clase anterior
        return TransitionsExample.fadeRoute(LoginScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute(){
    return MaterialPageRoute(builder: (_){
      return const Scaffold(
        body:  Center(
          child:  Text(
            "error!! No se encontro la ventana"
          ),
        ),
      );
    });
  }
}