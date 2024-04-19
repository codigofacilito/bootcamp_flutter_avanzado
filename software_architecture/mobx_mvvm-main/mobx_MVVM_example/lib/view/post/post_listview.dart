import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx_mvvm_example/main_store/main_state.dart';
import 'package:mobx_mvvm_example/model/post_model.dart';
import 'package:mobx_mvvm_example/view_model/post/post_state.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_mvvm_example/view/post/post_form_page.dart';
class PostListView extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=> PostListViewState();

}

class PostListViewState extends State<PostListView>{
  late PostState postState;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => postState.fetchPosts());
  }

  @override
  Widget build(BuildContext context) {
   postState = Provider.of<MainState>(context).postState;
   return Observer(builder:(_)=>postState.loading.value ? LinearProgressIndicator():
   ListView.builder(
       itemCount: postState.posts.length,
       itemBuilder: (context,index){
         PostModel postModel = postState.posts[index];
         return Card(child:ListTile(
           trailing: IconButton(
             icon: Icon(Icons.delete),
             onPressed: (){
               showDialog(context: context,
                   builder: (BuildContext context){
                 return alertDelete(context,postModel);
                   });
             },
           ),
           title: Text(postModel.title),
           subtitle:Text(postModel.body),
           onTap: (){
             postState.addCurrentPost(postModel);
             Navigator.push(context, MaterialPageRoute(builder: (_)=>PostFormPage()));
           },
         ));
       }));
  }

  AlertDialog alertDelete(context,postModel){
    return AlertDialog(
      title: Text("Confirmar"),
      content: Text("¿Deseas eliminar el post?"),
      actions: [
        TextButton(onPressed: (){
          postState.removePost(postModel);
          Navigator.pop(context);
        }, child: Text("Sí, Eliminar")),
        TextButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text("Cancelar"))
      ],
    );
  }

  @override
  void dispose() {

  }
}