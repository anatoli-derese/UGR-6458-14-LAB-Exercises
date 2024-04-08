

import 'package:flutter/material.dart';
import 'package:navigator/navigatoar2main.dart';
import 'package:navigator/screen3.dart';

void main() {
  runApp(const OnGenerate());
}

class OnGenerate extends StatelessWidget {
  const OnGenerate({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation on generate',
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (context) => const ScreenTwo());
          case '/four':
            return MaterialPageRoute(builder: (context) => const ScreenThree());
        }
          
      },
    );
  }
}
