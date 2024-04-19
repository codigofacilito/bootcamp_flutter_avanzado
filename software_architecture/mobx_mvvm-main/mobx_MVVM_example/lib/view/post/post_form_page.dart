import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobx_mvvm_example/main_store/main_state.dart';
import 'package:mobx_mvvm_example/model/post_model.dart';
import 'package:mobx_mvvm_example/view_model/post/post_state.dart';
import 'package:provider/provider.dart';

class PostFormPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>PostFormPageState();
}

class PostFormPageState extends State<PostFormPage>{
  GlobalKey<FormState>keyForm = GlobalKey();
  TextEditingController titleCtrl = TextEditingController();
  TextEditingController bodyCtrl = TextEditingController();
  late PostState postState;

  showText(){
    if(postState.currentPost.value!=null){
      titleCtrl.text = postState.currentPost.value!.title;
      bodyCtrl.text = postState.currentPost.value!.body;
    }
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    postState = Provider.of<MainState>(context).postState;
    showText();
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Formulario post"),),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(25),
        child: Form(
          key: keyForm,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text("Titulo",style: textTheme.titleLarge, ),
            TextFormField(
              controller: titleCtrl,
              style: textTheme.bodyLarge,
            ),
            SizedBox(
              height: 30,
            ),
            Text("Contenido",style: textTheme.titleLarge, ),
            TextFormField(
              controller: bodyCtrl,
              style: textTheme.bodyLarge,
            ),
             SizedBox(height: 30,) ,
              SizedBox(
                width: double.infinity,
                child:ElevatedButton(onPressed: ()=>save()
                  , child: Text("Guardar"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreen,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)
                )
              ),))
          ],)),
      ),
    );
  }
  save(){
   if(keyForm.currentState!.validate()){
     PostModel postModel = (postState.hasCurrentPost)?postState.currentPost.value!:PostModel();
     postModel.title = titleCtrl.text;
     postModel.body = bodyCtrl.text;
     (postState.hasCurrentPost)?postState.updatePost(postModel):postState.createPost(postModel);
     postState.addCurrentPost(null);
     Navigator.pop(context);
   }
  }

  @override
  void dispose() {
    super.dispose();
    postState.addCurrentPost(null);
  }
}