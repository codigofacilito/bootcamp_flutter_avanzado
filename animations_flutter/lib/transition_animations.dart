import 'dart:math';

import 'package:flutter/material.dart';

class CiclesLoader extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => CiclesLoaderState();
  
  
}


class CiclesLoaderState extends State<CiclesLoader> with SingleTickerProviderStateMixin{

  late AnimationController _controller;


  @override
  void initState() {
    _controller = AnimationController(vsync: this,duration: Duration(seconds: 2))..repeat();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Center(
     child: Container(
       width: 100,
       height: 50,
       decoration: BoxDecoration(
         borderRadius: BorderRadius.all(Radius.circular(20),),
         color: Colors.grey
       ),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: [
         buildCircle(.0),
         buildCircle(.2),
         buildCircle(.4),
       ],),
     ),
   );
  }

  buildCircle(double delay){
    return ScaleTransition(
      scale: TestTween(begin: .85,end:1.5,delay: delay).animate(_controller),
     child: Container(
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
          color: Colors.grey[300]
      ),
    ),);
  }

  @override
  void dispose() {
    _controller.dispose();
  }
}

class TestTween extends Tween<double>{
  final double? delay;
  TestTween({double? begin, double? end,this.delay})
  :super(begin: begin,end: end);

  @override
  double lerp(double t) {
    return super.lerp((sin((t-delay!)*2 *(3.1416))+1)/2);
  }
}