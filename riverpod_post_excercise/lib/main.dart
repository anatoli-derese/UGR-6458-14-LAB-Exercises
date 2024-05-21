import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final fetchedDataProvider = StateProvider<List<dynamic>>((ref) => []);

class ApiService {
  Future<List<dynamic>> fetchData(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}

final apiServiceProvider = Provider((ref) => ApiService());

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(fetchedDataProvider);
    final apiService = ref.watch(apiServiceProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetched Data'),
      ),
      body: Center(
        child: data.isEmpty
            ? const CircularProgressIndicator()
            : ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final item = data[index];
                  return Column(
                    children: [
                      ListTile(
                        title: Text(item['title']),
                        onTap: () {
                          Navigator.push(
                     context,
                      MaterialPageRoute(
                        builder: (context) => PostDetailScreen(postData: item),
                      ),
                                 );
                         },
                      ),
                      const Divider(),
                    ],
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final fetchedData = await apiService
              .fetchData('https://jsonplaceholder.typicode.com/albums');
          ref.read(fetchedDataProvider.notifier).state = fetchedData;
        } ,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}


class PostDetailScreen extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final Map<String, dynamic> postData;
  // ignore: non_constant_identifier_names
  const PostDetailScreen({super.key ,  required this.postData, });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Detail'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },),
      ),
      body: Center(
        child: Column(
          children: [
            Text(postData['title']),
            Text(postData['id'].toString()),
          ],
        ),
      ),
    );

  }
}

void main() {
  runApp(const ProviderScope(
    child: MaterialApp(
      home: MyHomePage(),
    ),
  ));
}