import 'package:autenticacion_oauth/main_store/main_state.dart';
import 'package:autenticacion_oauth/view/slash_screen.dart';
import 'package:autenticacion_oauth/view_model/session/session_state.dart';
import 'package:autenticacion_oauth/view_model/user/user_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../navigation/route.dart';
class HomeScreen extends StatelessWidget{
  late UserState userState;
  late SessionState sessionState;

  @override
  Widget build(BuildContext context) {
    MainState mainState = Provider.of<MainState>(context);
    userState = mainState.userState;
    sessionState = mainState.sessionState;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
       drawer: Drawer(
         child: ListView(
           children: [
            Observer(builder:(context)=> DrawerHeader(
                 decoration: BoxDecoration(
                   color: Colors.purple.withOpacity(0.4)
                 ),
                 child:Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
               CircleAvatar(
                 radius: 30.0,
                 backgroundImage: NetworkImage(userState.user.value.picture),
                 backgroundColor: Colors.transparent,
               ),
               SizedBox(height: 20,),
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                 Text(userState.user.value.name,style: TextStyle(color: Colors.white,fontSize: 20),),
                 Text(userState.user.value.nickname,style: TextStyle(color: Colors.white,fontSize: 15),)
                 ],)
             ],) )),
            Card(
                elevation: 0.2,
                child: ListTile(
               trailing: Icon(
                 Icons.close,
               ),
               title: const Text('Cerrar sesion'),
               onTap: () async {
                 await sessionState.closeSession();
                 Navigator.pushNamed(context, splashScreen);
               },
             ))
           ],
         ),
       ),
    );
  }

}