
import 'package:flutter/material.dart';
import 'package:navigator/page_four.dart';
import 'package:navigator/page_three.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/screen_one',
      routes: {
        '/screen_one':(context) => const PageThree(),
        '/screen_two':(context) => const PageFour()
      },
  )
);
