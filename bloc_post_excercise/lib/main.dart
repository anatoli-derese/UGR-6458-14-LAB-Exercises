import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'POST EXERCISE',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => AlbumBloc(AlbumService()),
        child: const AlbumScreen(),
      ),
    );
  }
}

class AlbumScreen extends StatelessWidget{
  
  const  AlbumScreen({super.key});

   @override
  Widget build(BuildContext context) {
    final albumBloc = BlocProvider.of<AlbumBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Albums'),
      ),
      body: BlocBuilder<AlbumBloc, List<Album>>(
        builder: (context, albums) {
          if (albums.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: albums.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(albums[index].title),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AlbumDetailScreen(album: albums[index])));
                
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          albumBloc.fetchPosts();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

class AlbumDetailScreen  extends StatelessWidget{
  final Album album;
  const AlbumDetailScreen({super.key, required this.album});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(album.title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: Center(
        child : Column(
          children: [
           Text(album.title),
            Text(album.id.toString()),
            Text(album.userId.toString()),
        ],)
      
      
      ),
    );
}
}


class Album {
  final int id;
  final int userId;
  final String title;
  Album({
    required this.id,
    required this.userId,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
    );
  }
}

class AlbumService {
  Future<List<Album>> fetchAlbums() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/'));
    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => Album.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}


class AlbumBloc extends Cubit<List<Album>> {
  final AlbumService postService;

  AlbumBloc(this.postService) : super([]);

  void fetchPosts() async {
    try {
      final posts = await AlbumService().fetchAlbums();
      emit(posts);
    } catch (e) {
      throw Exception(e);
    }
  }
}