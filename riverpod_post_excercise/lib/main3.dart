import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

final postServiceProvider = Provider((ref) => PostService());

final postProvider = FutureProvider.autoDispose<List<Post>>((ref) async {
  final postService = ref.read(postServiceProvider);
  return postService.getPosts();
});

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Posts exercise',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Posts'),
            centerTitle: true,
          ),
          body: Consumer(
            builder: (context, ref, _) {
              final AsyncValue<List<Post>> postsAsyncValue =
                  ref.watch(postProvider);
              return postsAsyncValue.when(
                data: (posts) {
                  return ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      final post = posts[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16.0),
                        child: Card(
                          elevation: 3.0,
                          child: ListTile(
                            title: Text(
                              post.title,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(post.body),
                          ),
                        ),
                      );
                    },
                  );
                },
                loading: () => const Center(
                  child: Text(
                    'L O A D I N G . . .',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                error: (error, stackTrace) =>
                    Center(child: Text('Error: $error')),
              );
            },
          ),
        ),
      ),
    );
  }
}

class Post {
  final int id;
  final int userId;
  final String title;
  final String body;

  Post({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
      body: json['body'],
    );
  }
}

class PostService {
  Future<List<Post>> getPosts() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}