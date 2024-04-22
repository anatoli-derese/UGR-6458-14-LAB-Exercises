import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


abstract class CounterEvent {}
class IncrementEvent extends CounterEvent {}
class DecrementEvent extends CounterEvent {}


class CounterState {
  final int count;
  CounterState(this.count);
}

class CounterBloc extends Bloc<CounterEvent, int> {
 CounterBloc() : super(0) {
   on<IncrementEvent>(
(event, emit) => emit(state + 1)
);
   on<DecrementEvent>(
(event, emit) => emit(state - 1)
);
 }
}





void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => CounterBloc(),
        child: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Using Bloc state MGMT'),
      ),
      body: BlocProvider(
        create:(BuildContext context) => CounterBloc(),
        child: BlocBuilder<CounterBloc, int>(
          builder: (context, count) {
            return Center(
              child: Column(
                children: [
                  Center( 
                    child: Text(
                      '$count',
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),

                  FloatingActionButton(
                    onPressed: () {
                      context.read<CounterBloc>().add(IncrementEvent());
                    },
                    child: const Icon(Icons.add),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      context.read<CounterBloc>().add(DecrementEvent());
                    },
                    child: const Icon(Icons.remove),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      )
  ;
  }
}
