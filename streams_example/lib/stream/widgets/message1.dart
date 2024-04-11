import 'dart:async';

import 'package:flutter/material.dart';

class Message1 extends StatelessWidget{
  StreamController<String> controller;
  Message1(this.controller);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Container(
     height: 200,
     width: 200,
     color: Colors.green,
     child: StreamBuilder<String>(
       stream: controller.stream,
       builder: (context,snapshot){
         if(snapshot.connectionState==ConnectionState.active || snapshot.connectionState==ConnectionState.done){
           return Center(child:
             Text(snapshot.data??"Sin dato"));
         }else{
           return const Center(child: CircularProgressIndicator(),);
         }
       },
     ),
   );
  }

}