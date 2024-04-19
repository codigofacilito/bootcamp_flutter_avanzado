import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../domain/entity/character.dart';

typedef OnCharacterClick= void Function(Character character);
class CharacterCard extends StatelessWidget{
  Character character;
  OnCharacterClick? onCharacterClick;
  CharacterCard(this.character,this.onCharacterClick);
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    // TODO: implement build
    return GestureDetector(
        onTap: ()=> onCharacterClick!.call(character),
        child:Card(
      margin: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
        Hero(
            tag: character.id!,
            child:  CachedNetworkImage(
            imageUrl: character.image!,
            height: 122,
            width: 122,
            fit: BoxFit.cover,
            errorWidget: (ctx,url,err)=>Icon(Icons.error_rounded),
            placeholder: (ctx, url)=>Icon(Icons.image),
          )),
          Padding(padding: EdgeInsets.only(left: 10),child:
       SizedBox(
           width: 250,
           child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(character.name!,
                textAlign: TextAlign.start,
                softWrap: true,
                style: textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),),
              SizedBox(height: 10,),
              Text(character.isAlive?"Vivo":"Muerto",
                softWrap: true,
                style: textTheme.bodySmall!.copyWith(
                  color: character.isAlive?Colors.lightGreen: Colors.red
                ),),
              SizedBox(height: 10,),
              Text(character.location!.name!,
                softWrap: true,
              style: textTheme.labelSmall,),
            ],
          )))
        ],
      )
    ));
  }

}