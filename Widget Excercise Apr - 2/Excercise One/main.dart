import 'package:flutter/material.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        
        appBar: AppBar(
          leading:const Icon(Icons.arrow_back),
          actions: const [
            Icon(Icons.exit_to_app),
            Icon(Icons.settings)
          ],
        ),
        body:  Column(children: [
      
          Image.asset('assets/abc.jpeg'),
      
           const Text('1975 Porsche 911 caerra'),
          const  Row(
            mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
            
            children: [
            Icon(Icons.thumb_up_outlined),
            Text('3'),
            Icon(Icons.message),
            Text('3'),
            Icon(Icons.share),
            Text('2'),
          ],),
      
           Column(
            
            children: [
              
              Container(
                margin: const EdgeInsets.all(10),
                decoration:const BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 2.0, color: Colors.black), // Top border
                    bottom: BorderSide(width: 2.0, color: Colors.black), // Bottom border
                  ),
                ),
                child:const  Text('Essential Information', style: TextStyle(
                  fontSize: 30
                
                
                ),),
              ),
               const EssentialInformation(),
               const SizedBox(height: 20),
               const EssentialInformation(),
               const SizedBox(height: 20),
               const EssentialInformation(),
               const SizedBox(height: 20),
            ],
          ),

        ],),
      
      
        
      ),
    );
}
}

class EssentialInformation extends StatelessWidget {
  const EssentialInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:const BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 2.0, color: Colors.black), // Top border
                  ),
                ),
      child: const Column(
        
      
        crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Row(
            children: [
             Icon(Icons.done, color: Colors.green, size: 25,),
             Text('Year Model Make', style: TextStyle(
              fontSize: 25,
              
            ),
            )
          ],),
      
          Column(
            crossAxisAlignment:  CrossAxisAlignment.center,
            children: [
                Text('Year: 1231'),
                Text('Make: 1231'),
                Text('Model: 1231'),
                Text('VIN: 329')
            ],
          )
        ],
      
      ),
    );
  }
}
