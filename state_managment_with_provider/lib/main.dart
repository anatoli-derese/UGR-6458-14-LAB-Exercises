import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CounterProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class CounterProvider with ChangeNotifier {
  int _counter = 23;

  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners();
  }

  void decrement() {
    _counter--;
    notifyListeners();
  }
}



class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
       
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [

            Column(
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Consumer<CounterProvider>(
                builder: (context, counterProvider, _) => Text(
                  '${counterProvider.counter}',
                ),
              ),
            ],
            
            ),


            FloatingActionButton(
              tooltip: 'Increment',              
              onPressed:  (){
                Provider.of<CounterProvider>(context, listen: false).increment();

              },
              child: const Icon(Icons.add)),

            const SizedBox(
              height: 10,
            ),
            FloatingActionButton(
              tooltip: 'Decrement', 
              onPressed:  (){
                Provider.of<CounterProvider>(context, listen: false).decrement();

              },
              child:  const Icon(Icons.remove),
              )
          ],
        ),
      ),
     
      
    );
  }
}
