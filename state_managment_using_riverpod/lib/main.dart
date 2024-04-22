import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
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
      home:  const MyHomePage(),
    );
  }
}


// ignore: non_constant_identifier_names
final CounterStateProvider = StateProvider<int>  ((ref){
  return 0;
});

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

 @override
  Widget build(BuildContext context, WidgetRef ref) {
    var value = ref.watch(CounterStateProvider);
    return Scaffold(
      body: Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Clicked $value times'
               ,),
                const SizedBox(
                  height: 10,
                ),
               FloatingActionButton(
                onPressed: () => ref.read(CounterStateProvider.notifier).state++
                ,child: const Icon(Icons.add)
                ),
                const SizedBox(
                  height: 10,
                ),
                FloatingActionButton(
                  onPressed: () => ref.read(CounterStateProvider.notifier).state--
                  ,child: const Icon(Icons.remove)
                )
            ],
          ),
    
           
    ));
    
  }
}



