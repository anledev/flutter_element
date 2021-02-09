
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_element/network/app_client.dart';

class MainNetwork extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        onPressed: () {
          // getHttpDio();
          getUseClient();
        },
        child: Text("Fetch Data"),
      ),
    );
  }

  void getUseClient() async{
    Response response = await AppClient.instance.dio.get("https://jsonplaceholder.typicode.com/posts/1");
    print(response);
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
