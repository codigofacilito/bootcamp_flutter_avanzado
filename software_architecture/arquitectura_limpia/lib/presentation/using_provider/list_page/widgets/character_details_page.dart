import 'package:arquitectura_limpia/domain/entity/character.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CharacterDetailPage extends StatelessWidget{
  Character character;
  CharacterDetailPage(this.character);
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    // TODO: implement build
   return Scaffold(
     appBar: AppBar(
       title: Text("Detalles"),
     ),
     body: SingleChildScrollView(
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.stretch,
         children: [
        Hero(tag: character.id!,
            child: CachedNetworkImage(imageUrl: character.image!,
         height: 300,
         fit: BoxFit.cover,)),
          Padding(padding: EdgeInsets.all(10),child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Text(character.name!,style: textTheme.headlineLarge,),
             Text(character.isAlive?"Vivo":"Muerto",style:
             textTheme.headlineSmall!.copyWith(color:character.isAlive?Colors.lightGreen:Colors.red ),),
             Text(character.species!)
           ],))

       ],),

     ),
   );
  }

}