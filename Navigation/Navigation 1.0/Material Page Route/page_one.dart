// ignore: file_names
import 'package:flutter/material.dart';
import 'package:navigator/page_two.dart';

class PageOne extends StatefulWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  State<PageOne> createState() => _PageOneState ();
}

class _PageOneState extends State<PageOne> {
  String response = ''; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Widget 1"),
      ),
      body: Center(
        child: Row(
          children: [
            const Text("Screen One"
            ),
            IconButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const PageTwo(),
                    settings: const RouteSettings(arguments: "This is from screen 1"),
                  ),
                );
                setState(() {
                  response = result ?? ''; 
                });
              },
              icon: const Icon(Icons.arrow_forward),
            ),
            Text(response
            ), 
          ],
        ),
      ),
    );
  }
}
