import 'package:autenticacion_oauth/main_store/main_state.dart';
import 'package:autenticacion_oauth/navigation/route.dart';
import 'package:autenticacion_oauth/view/home_screen.dart';
import 'package:autenticacion_oauth/view/slash_screen.dart';
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
   return SafeArea(child: Scaffold(
     body: SingleChildScrollView(
       child: Form(
         key: formKey,
         child:Padding(
           padding: EdgeInsets.all(15),
           child: Column(
           children: [
           _header(context),
           SizedBox(height: 70,),
           _inputField(context),
           _forgotPassword(context),
           _signup(context),
         ],),

       ),
     ),
   )));
  }

  login()async{
    if(formKey.currentState!.validate()){
      await sessionState.login(emailCtrl.text, passCtrl.text);
      Navigator.pushNamed(context, splashScreen);
    }
  }

  _inputField(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(controller: emailCtrl,
          decoration: InputDecoration(
              hintText: "Username",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none
              ),
              fillColor: Colors.purple.withOpacity(0.1),
              filled: true,
              prefixIcon: const Icon(Icons.person)),
        ),
        const SizedBox(height: 30),
        TextField(
          controller: passCtrl,
          decoration: InputDecoration(
            hintText: "Password",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
            fillColor: Colors.purple.withOpacity(0.1),
            filled: true,
            prefixIcon: const Icon(Icons.password),
          ),
          obscureText: true,
        ),
        const SizedBox(height: 40),
        ElevatedButton(
          onPressed: login,
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(vertical: 16),
            backgroundColor: Colors.purple,
          ),
          child: const Text(
            "Login",
            style: TextStyle(fontSize: 20),
          ),
        )
      ],
    );
  }


  _header(context) {
    return const Column(
      children: [
        Text(
          "Iniciar session",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  _forgotPassword(context) {
    return TextButton(
      onPressed: () {},
      child: const Text("¡Olvidaste tu contraseña?",
        style: TextStyle(color: Colors.purple),
      ),
    );
  }

  _signup(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("No tienes una cuenta? "),
        TextButton(
            onPressed: () {
            },
            child: const Text("Registrarte", style: TextStyle(color: Colors.purple),)
        )
      ],
    );
  }

}
