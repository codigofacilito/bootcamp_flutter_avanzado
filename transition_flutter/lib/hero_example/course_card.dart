import 'package:flutter/material.dart';
import 'package:transition_flutter/navigation/route.dart';

import 'course_model.dart';

class CourseCard extends StatelessWidget{
  CourseModel courseModel;
  CourseCard(this.courseModel);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
        onTap: (){
          Navigator.pushNamed(context, courseDetailsScreen,arguments: courseModel);
        },
        child:Card(
      child: Column(children: [
       Hero(tag:courseModel.heroTag,
           child: Image.network(courseModel.image)),
        Column(children: [
          Text(courseModel.title),
        ],)
      ],),
    ));
  }
}