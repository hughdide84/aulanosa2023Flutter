import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class DatosUsuarios extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listado API"),
      ),
      body: Container(
        child: FutureBuilder<dynamic>(
          future: fetchUsersFromGitHub(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  // Text("userId--> " + snapshot.data!.userId.toString()),
                  // Text("id-> " + snapshot.data!.id.toString()),
                  // Text("title-> " + snapshot.data!.title),
                  // Text("body->" + snapshot.data!.body),
                  Card(
                    child: ListTile(
                        leading: Icon(Icons.person),
                        title: Text(snapshot.data!.userId.toString() +
                            "->" +
                            snapshot.data!.title),
                        subtitle: Text(snapshot.data!.id.toString() +
                            "->" +
                            snapshot.data!.body)),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return new Text("${snapshot.error}");
            }
            return new CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  String url = "https://jsonplaceholder.typicode.com/posts/1";

  Future<Post> fetchUsersFromGitHub() async {
    Uri myUri = Uri.parse(url);
    final response = await http.get(myUri);

    Map<String, dynamic> responseJson = json.decode(response.body.toString());

    Post post = new Post(
        userId: responseJson['userId'],
        id: responseJson['id'],
        title: responseJson['title'],
        body: responseJson['body']);
    return post;

    // return Post.fromJson(json.decode(response.body));
  }
}

class Post {
  int userId;
  int id;
  String title;
  String body;

  Post(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});
}
