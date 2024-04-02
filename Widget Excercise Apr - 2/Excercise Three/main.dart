import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
// ignore: prefer_const_constructors

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('BMI Calculator',style: TextStyle(
            color: Colors.white
          ),),
          backgroundColor: Colors.blueAccent,
        ),
       
       
        bottomSheet: Container(
          color: Colors.blueAccent,
          width: double.infinity,
          
          child: SizedBox(
            child: TextButton(
              child: const Text(
                'Calculate',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              onPressed: () {},
            ),
          ),
        ),

        body: Container(
          color: Colors.blueAccent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 120,
                    height: 110,
                    child: Card(
                      color: Color.fromARGB(255, 42, 71, 94),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            Icons.male,
                            color: Colors.white,
                            size: 34,
                          ),
                          Text(
                            'Male',
                            style: TextStyle(color: Colors.white, fontSize: 23),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 120,
                    height: 110,
                    child: Card(
                      color: Color.fromARGB(255, 30, 53, 72),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            Icons.female,
                            color: Colors.white,
                            size: 34,
                          ),
                          Text(
                            'Female',
                            style: TextStyle(color: Colors.white, fontSize: 23),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              //middle card

              SizedBox(
                width: double.infinity,
                height: 110,
                child: Card(
                  color: const Color.fromARGB(255, 30, 53, 72),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text('HEIGHT'),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '176',
                            style: TextStyle(color: Colors.white, fontSize: 23),
                          ),
                          Text(' cm')
                        ],
                      ),
                      Slider(
                        value: 150, // Set initial value
                        min: 0, // Set minimum value
                        max: 300, // Set maximum value
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 120,
                    height: 150,
                    child: Card(
                      color: const Color.fromARGB(255, 30, 53, 72),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text("Weight"),
                          const Text(
                            "60",
                            style: TextStyle(color: Colors.white, fontSize: 23),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                color: Colors.blue,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.minimize_outlined,
                                    color: Colors.white,
                                    size: 12,
                                  ),
                                ),
                              ),
                              Container(
                                color: Colors.amber,
                                child: IconButton(
                                    disabledColor:
                                        const Color.fromARGB(255, 162, 11, 11),
                                    color:
                                        const Color.fromARGB(255, 64, 2, 146),
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 12,
                                    )),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 120,
                    height: 150,
                    child: Card(
                      color: const Color.fromARGB(255, 30, 53, 72),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text(
                            "Age",
                          ),
                          const Text(
                            "23",
                            style: TextStyle(fontSize: 23, color: Colors.white),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                color: Colors.blue,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.minimize_outlined,
                                    color: Colors.white,
                                    size: 12,
                                  ),
                                ),
                              ),
                              Container(
                                color: Colors.amber,
                                child: IconButton(
                                    disabledColor:
                                        const Color.fromARGB(255, 162, 11, 11),
                                    color:
                                        const Color.fromARGB(255, 64, 2, 146),
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 12,
                                    )),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
