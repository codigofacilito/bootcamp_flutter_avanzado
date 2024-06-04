import 'package:flutter/material.dart';
import 'package:transition_flutter/navigation/route.dart';

class Screen1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.purpleAccent.withOpacity(0.5),
      body: SafeArea(child:Center(
        child: Column(
          children: [
            Text("Hola mundo"),
            TextButton(onPressed: (){
              Navigator.pushNamed(context, screen2);
            }, child: Text("Abrir screen2"))
          ],
        ),
      ),
    ));
  }

}