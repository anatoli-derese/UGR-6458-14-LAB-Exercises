// import 'package:flut_app/Navigator_1.0_pushNamed/Widget_four.dart';
import 'package:flutter/material.dart';

class PageThree extends StatefulWidget {
  const PageThree({Key? key}) : super(key: key);

  @override
  State<PageThree> createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Widget 1"),
      ),
      body: Row(
        children: [
          const Text("Screen One"),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context, '/screen_two'
              );
            },
            icon: const Icon(Icons.arrow_forward),
          ),
          
        ],
      ),
    );
  }
}
