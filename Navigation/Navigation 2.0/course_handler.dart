
import 'package:flutter/material.dart';
import 'package:navigator/main.dart';

class CoursesListScreen extends StatelessWidget {
 const CoursesListScreen({required this.courses, required this.onTapped});
 final List<Course> courses;
 final ValueChanged<Course> onTapped;

 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
      backgroundColor: Colors.blue  ,
      title: const Text("Courses List"
     
     )
          ),
     body: ListView(
       children: [
         for (var course in courses)
           ListTile(
             title: Text(course.title, style: const TextStyle(
              fontSize: 20
             ),),
             subtitle: Text(course.code),
             onTap: () => onTapped(course),
           ),
       ],
     ),);}
}


class CourseDetailsScreen extends StatelessWidget {
 final Course course;
 const CourseDetailsScreen({required this.course});
 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(title: Text(course.title)),
     body: Center(
       child: Column(
         children: [
           Text(course.title),
           Text(course.code),
           Text(course.description),
         ],
       ),),);
 }
}