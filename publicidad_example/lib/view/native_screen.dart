import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:publicidad_example/main_store/main_state.dart';
import 'package:publicidad_example/view_model/ads_state.dart';

class NativeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>NativeScreenState();

}

class NativeScreenState extends State<NativeScreen>{
  late AdsState adsState;


  @override
  Widget build(BuildContext context) {
    adsState = Provider.of<MainState>(context).adsState;
    // TODO: implement build
   return Scaffold(
        appBar: AppBar(title: Text("Nativo"),),
        body:ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 16),
       itemBuilder: (_,int index){
         return ConstrainedBox(constraints:
         BoxConstraints(
           minHeight: 350,
           maxHeight: 350,
           maxWidth: double.maxFinite
         ),
           child:(index == 2 && adsState.nativeAd!=null)?
           AdWidget(ad: adsState.nativeAd!.value):
           Container(
             decoration: BoxDecoration(
                 color: Colors.white,
                 border: Border.all(
                     color: Colors.grey.withOpacity(0.5),
                     width: 1
                 )
             ),
             height: 180,
             width: double.maxFinite,
             child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
            SizedBox(
              height: 180,
                width:double.maxFinite,child:FlutterLogo()),
             SizedBox(height: 30,),
             Text("DEscripcion de la publicidad "),
             SizedBox(
               width: double.maxFinite,
               child: ElevatedButton(
                 style: ElevatedButton.styleFrom(
                   backgroundColor: Colors.blue,
                   foregroundColor: Colors.white,
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(0)
                   )
                 ),
                 child:Text("Ver Producto") ,onPressed: (){},),
             )
           ],))
         );
       },
       separatorBuilder: (_,index){
         return SizedBox(height: 10,);
       }, itemCount: 10));
  }

}