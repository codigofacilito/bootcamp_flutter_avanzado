import 'package:autenticacion_oauth/locator.dart';
import 'package:autenticacion_oauth/main_store/main_state.dart';
import 'package:autenticacion_oauth/navigation/route.dart';
import 'package:autenticacion_oauth/view/home_screen.dart';
import 'package:autenticacion_oauth/view/login_screen.dart';
import 'package:autenticacion_oauth/view/slash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'navigation/navigation_app.dart';

void main() async{
  await setupLocator();
  runApp(
      Provider(create:(_)=>MainState(),child:const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: splashScreen,
    );
  }
}