import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project6/Models/post_models/post_models.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

List<PostModels> postList = [];
Future<List<PostModels>> getPostApi() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  var data = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    for (Map<String,dynamic> i in data) {
      postList.add(PostModels.fromJson(i));
    }
    return postList;
  } else {
    return postList;
  }
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('APi'),
        centerTitle: true,
      ),
      body: Column(
        children: [
       FutureBuilder(
  future: getPostApi(),
  builder: (context, snapshot) {
    if (!snapshot.hasData) {
      if (snapshot.hasError) {
        return Text('Error: ${snapshot.error}');
      } else {
        return  const Center(
          child: CircularProgressIndicator(),
        );
      }
    } else {
      return ListView.builder(
        itemCount: postList.length,
        itemBuilder: (context, index) {
           return Text(postList[index].title ?? "No title available");
        },
      );
    }
  },
)

        ],
      ),
    );
  }
}
