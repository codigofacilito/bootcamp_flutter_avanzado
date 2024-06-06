import 'package:autenticacion_oauth/main_store/main_state.dart';
import 'package:autenticacion_oauth/view/home_screen.dart';
import 'package:autenticacion_oauth/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => SplashScreenState();

}

class SplashScreenState extends State<SplashScreen>with TickerProviderStateMixin{
  double turns = 0.0;
  late AnimationController animationController;


  @override
  void initState() {
    animationController =  AnimationController(vsync: this, duration: Duration(seconds: 2))..repeat(reverse: true);

    MainState mainState = Provider.of<MainState>(context,listen: false);
    mainState.sessionState.init().whenComplete(() {
      if(mainState.sessionState.hasSession.value){
        Navigator.push(context, MaterialPageRoute(builder: (_)=>HomeScreen()));
      }else{
        Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginScreen()));
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Center(child:RotationTransition(
          turns: animationController,
          child: Icon(Icons.settings_sharp,size: 200,color: Colors.purple.withOpacity(0.7),),
          alignment: Alignment.center,
        ),
        ));
  }

}