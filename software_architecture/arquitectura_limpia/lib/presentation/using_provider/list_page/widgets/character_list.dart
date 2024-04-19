import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../domain/entity/character.dart';
import '../change_notifier/change_notifier.dart';
import 'character_card.dart';
import 'character_details_page.dart';

class CharacterList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>CharacterListState();
}

class CharacterListState extends State<CharacterList>{
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<CharacterPageChangeNotifier>(context,listen: false).fetchNextPage();
    });
    scrollController.addListener(onScroll);
  }

  @override
  Widget build(BuildContext context) {
    final status = Provider.of<CharacterPageChangeNotifier>(context).status;
    final list = Provider.of<CharacterPageChangeNotifier>(context).characters;
    final hasEnd = Provider.of<CharacterPageChangeNotifier>(context).hasReachedEnd;

    // TODO: implement build
   return status ==CharacterPageStatus.initial && status==CharacterPageStatus.loading?
   const LinearProgressIndicator():
   ListView.builder(
     shrinkWrap: true,
     controller: scrollController,
     itemCount: hasEnd?list.length:list.length + 1,
       itemBuilder: (context,index){
       if(index >= list.length){
         return !hasEnd?
             SizedBox(
               height: 80,
               child:
               Center(child:CircularProgressIndicator(),)):SizedBox();
       }
       Character character =  list[index];
         return CharacterCard(character,onToDetailsPage);
       });
  }

  onToDetailsPage(Character character){
    Navigator.of(context).push(MaterialPageRoute(
        builder: (_)=>CharacterDetailPage(character)));
  }

 onScroll(){
    final maxScroll= scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;

    if(currentScroll>=maxScroll){
      Provider.of<CharacterPageChangeNotifier>(context,listen: false).fetchNextPage();
    }
 }

  @override
  void dispose() {
    scrollController..removeListener(onScroll)..dispose();
  }
}