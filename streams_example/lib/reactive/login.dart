import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:streams_example/reactive/model/account_model.dart';
import 'package:streams_example/reactive/state/account_state.dart';

class Login extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Account account = Account();
    // TODO: implement build
    return Container(
        width: 200,
        height: 200,
        color: Colors.greenAccent,
        child:Column(children: [
          Observer(
            builder: (_){
              if(account.isLoading.value){
                return CircularProgressIndicator();
              }else{
                return Text((account.accountModel!=null)?"Bienvedido ${account.accountModel!.value.name}":"");
              }
            },
          ),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: (){
            account.addAccount(AccountModel(id: 1,name: "Marines",email: "marines@codigofacilito.com",password: "12345"));
          }, child: Text("Iniciar Sesion")),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: (){
            account.addAccount(AccountModel(id: 2,name: "Cody",email: "cody@codigofacilito.com",password: "12345"));
          }, child: Text("Iniciar Sesion"))
    ],));
  }

}