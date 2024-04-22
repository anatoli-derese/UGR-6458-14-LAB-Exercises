import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

void main() {  
  runApp(const MyApp());
}


class Album {
  final int id;
  final String title;
  final int userId;

  Album({required this.id, required this.title, required this.userId});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId:json['userId'] ,
      id: json['id'],
      title: json['title'],
    );
  }
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AlbumProvider(),
      child: const MaterialApp(home:  MyHomePage()));

  }
}

class AlbumProvider  extends ChangeNotifier{
  List<Album> _albums = [];
  bool _loading = false;

  List<Album> get albums => _albums;
  bool get loading => _loading;

  Future<void> fetchAlbums() async {
    _loading = true;
    notifyListeners();
    try{
      _albums = await AlbumService.fetchAlbums();
    }
    catch(e){
      debugPrint(e.toString());
    }
    _loading = false;
    notifyListeners();
  }
}


class AlbumService {
  static Future<List<Album>> fetchAlbums() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Album.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load albums');
    }
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AlbumProvider>(context);
    if (provider.loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Albums'),
      ),
      body: ListView.builder(
        itemCount: provider.albums.length,
        itemBuilder: (context, index) {
          final album = provider.albums[index];
          return ListTile(
            title: Text(album.title),
            subtitle: Text('ID: ${album.id}, UserID: ${album.userId}'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(album: album)));
            
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => provider.fetchAlbums(),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}


class DetailPage extends StatelessWidget {
  final Album album;

  const DetailPage({super.key, required this.album});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(album.title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        )
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('ID: ${album.id}'),
            Text('UserID: ${album.userId}'),
          ],
        ),
      ),
    );
  }
}