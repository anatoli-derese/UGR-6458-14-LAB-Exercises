import 'package:flutter/material.dart';
import 'package:navigator/course_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}



void onTapped(context){
  print(context);
}


class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home: CourseApp());
  }
}

class Course {
 String code;
 String title;
 String description;
 Course({required this.code, 
         required this.title,  
         this.description = ""});
}





class CourseApp extends StatefulWidget {
 @override
 State<CourseApp> createState() => _CourseAppState();
}
class _CourseAppState extends State<CourseApp> {
 
 
Course? _selectedCourse;
 
 void _tabHandler(Course course) {
   setState(() {
    _selectedCourse = course;
   });
 }

List<Course> courses =[
  Course(code: '2014', title: "Mobile Development", description: "An introduction to mobile development"),
  Course(code: '1024', title: 'Maths', description: "Mathematics for teh enthusiasts"),
  Course(code: '322', title: 'Physic', description: "Physics is the ing mannn!")

];

 @override
 Widget build(BuildContext context) {
   return MaterialApp(
     home:Navigator(
       pages: [
         MaterialPage(
           key: const ValueKey('CourseListScreen'),
           child: CoursesListScreen(courses: courses, onTapped: _tabHandler,),
         ),
         if (_selectedCourse != null)
           MaterialPage(
               key: ValueKey(_selectedCourse),
               child: CourseDetailsScreen(course: _selectedCourse!,))
       ],
       onPopPage: (route, result) {
         if (!route.didPop(result)) {
           return false;
         }
         setState(() {
           _selectedCourse = null;
         });
         return true;
       },
      
     ),

   );
 }

}




