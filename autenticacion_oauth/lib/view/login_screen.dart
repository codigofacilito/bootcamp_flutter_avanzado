import 'package:autenticacion_oauth/main_store/main_state.dart';
import 'package:autenticacion_oauth/view_model/session/session_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => LoginScreenState();

}

class LoginScreenState extends State<LoginScreen>{
  GlobalKey<FormState>formKey = GlobalKey();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();
  late SessionState sessionState;
  @override
  Widget build(BuildContext context) {
    sessionState = Provider.of<MainState>(context).sessionState;

    // TODO: implement build
   return Scaffold(
     body: SingleChildScrollView(
       child: Form(
         key: formKey,
         child: Column(children: [
           Text("email"),
           TextFormField(
             controller: emailCtrl,
           ),      SizedBox(height: 30,),
           Text("Contraseña"),
           TextFormField(
             controller: passCtrl,
             obscureText: true,
           ),
           SizedBox(height: 30,),
           ElevatedButton(onPressed:login, child: Text("Iniciar Session"))
         ],),

       ),
     ),
   );
  }
  login(){
    if(formKey.currentState!.validate()){
      sessionState.login(emailCtrl.text, passCtrl.text);
    }
  }
}