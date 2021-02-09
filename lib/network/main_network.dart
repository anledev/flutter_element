import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_element/network/app_client.dart';

class MainNetwork extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FutureBuilder<Post>(
          future: getPostWithCompleter(),
          builder: (context, snapshot) {
            if(snapshot.hasError){
              return Text("Error!!!");
            }
            if(snapshot.hasData){
              return Text(snapshot.data.title);
            }
            return Text("Waiting for result..");
          },
        ),
        RaisedButton(
          onPressed: () {
            // getHttpDio();
            // getUseClient();
            getPost();
          },
          child: Text("Fetch Data"),
        ),
      ],
    );
  }

  getUseFutureBuilder() {}

  void getPost() {
    getPostWithCompleter().then((value) => {print("Title: ${value.title}")});
  }

  Future<Post> getPostWithCompleter() async {
    var c = Completer<Post>();
    var response = await getUseFuture();
    if (response.statusCode == 200) {
      var post = Post.fromJson(response.data);
      c.complete(post);
    }
    return c.future;
  }

  Future<Response> getUseFuture() {
    return AppClient.instance.dio
        .get("https://jsonplaceholder.typicode.com/posts/1");
  }

  void getUseClient() async {
    Response response = await AppClient.instance.dio
        .get("https://jsonplaceholder.typicode.com/posts/1");
    if (response.statusCode == 200) {
      var post = Post.fromJson(response.data);
      print("Title: ${post.title}");
    }
  }

  void getHttpDio() async {
    try {
      Response response =
          await Dio().get("https://jsonplaceholder.typicode.com/posts/1");
      print(response);
      if (response.statusCode == 200) {
        var post = Post.fromJson(response.data);
        print("Title: ${post.title}");
      }
    } catch (e) {
      print(e);
    }
  }
}

class Post {
  int userId;
  int id;
  String title;
  String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
