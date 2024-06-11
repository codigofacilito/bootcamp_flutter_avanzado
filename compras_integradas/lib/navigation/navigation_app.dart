

import 'package:compras_integradas/navigation/route.dart';
import 'package:compras_integradas/navigation/transitions.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../view/purchases/screens/get_premium_screen.dart';
import '../view/purchases/screens/get_products_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;
    switch(settings.name){
      case mainScreen:
        return MaterialPageRoute(builder: (_)=>MyHomePage());
      case getPremiumScreen:
        //Transicion con el paquete page_transition
        return TransitionsExample.fadeRoute(GetPremiumScreen());
      case getProductsScreen:
      //Transicion con el paquete page_transition
       return TransitionsExample.fadeRoute(GetProductsScreen());

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