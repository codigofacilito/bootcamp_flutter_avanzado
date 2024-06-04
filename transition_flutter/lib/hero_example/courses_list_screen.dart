import 'package:flutter/material.dart';
import 'package:transition_flutter/hero_example/course_card.dart';

import 'course_model.dart';

class CoursesListScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView.builder(
          itemCount: CourseModel.courses.length,
          itemBuilder: (_,index){
        return CourseCard(CourseModel.courses[index]);
      }),
    );
  }

}