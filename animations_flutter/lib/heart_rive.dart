import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class HeartRive extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=>HeartRiveState();
  
}

class HeartRiveState extends State<HeartRive>{

  SMIBool? _input;
  bool status = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      height: 50,
      width: 50,
      child: InkWell(
        onTap: (){
          setState(() {
            status = !status;
            _input!.value = status;
          });
        },
        child: RiveAnimation.asset("assets/images/rive/icons.riv",
          onInit: (art){
            _onRiveInit( art);
        },),
      ),
    );
  }

  _onRiveInit(Artboard art){
    var controller = StateMachineController.fromArtboard(art,"State Machine 1");
    _input = controller!.findInput<bool>("status") as SMIBool;
    art.addController(controller);
    _input!.change(status);
  }
}