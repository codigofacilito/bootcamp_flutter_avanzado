import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Skeleton extends StatefulWidget{
  double height;
  double width;
  Skeleton({Key? key, this.height=20,this.width=200}):super(key: key);
  @override
  State<StatefulWidget> createState() => SkeletonState();

}

class SkeletonState extends State<Skeleton> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation gradientPosition;

  @override
  void initState() {
    _controller = AnimationController(vsync: this,duration: Duration(seconds: 2));

    gradientPosition = Tween<double>(
      begin: -3,
      end: 10
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.linear))
    ..addListener(() {
      setState(() {
        if(_controller.status==AnimationStatus.completed){
          _controller.repeat();
        }
      });
    });

    _controller.forward();
  }


  @override
  void dispose() {
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(gradientPosition.value,0),
          end: Alignment(-1,0),
          colors: [Colors.black12,Colors.black26,Colors.black12]
        )
      ),
    );
  }

}