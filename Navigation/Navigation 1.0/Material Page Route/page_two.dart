import 'package:flutter/material.dart';

class PageTwo extends StatefulWidget {
  const PageTwo({super.key});

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {

    final response=ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Widget 2"),
      ),
      body: Center( 
        child: Row(
          children: [
            const Text("Screen Two",
            style: TextStyle(
              fontSize: 30
            ),),
            IconButton(
              onPressed: (){
                Navigator.pop(context, "This is from screen two");
              }, 
              icon: const Icon(Icons.arrow_back)),
            Text(response)
          ],
        ),
      )
    );
  }
}