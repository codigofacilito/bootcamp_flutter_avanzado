import 'package:flutter/material.dart';

import 'course_model.dart';

class CourseDetailsScreen extends StatelessWidget{
  CourseModel courseModel;
  CourseDetailsScreen(this.courseModel);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(body:Column(children: [
            Column(children: [
              Text(courseModel.title),
              Text(courseModel.description),
              Hero(tag:courseModel.heroTag,
                  child: Image.network(courseModel.image))
            ],)
          ]));
  }
}