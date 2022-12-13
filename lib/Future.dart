import 'Post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _urlBase = "https://jsonplaceholder.typicode.com";

  Future<List<Post>> _recuperarPostagens() async {
    http.Response response = await http.get(_urlBase + "/posts");
    var dadosJson = json.decode(response.body);

    List<Post> postagens = [];
    for (var post in dadosJson) {
      Post p = Post(post["userId"], post["id"], post["title"], post["body"]);
      postagens.add(p);
    }
    return postagens;
    //print( postagens.toString() );
  }

  _post() async {
    String corpo = jsonEncode(
      {
        "userId": 120,
        "id": null,
        "title":
            "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
        "body": "Corpo da postagem"
      },
    );

    http.Response response = await http.post(_urlBase + "/posts",
        headers: {
          'Content-type': 'application/json; charset=UTF-8',
        },
        body: corpo);

    if (response.statusCode == 201) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Postagem realizada com sucesso"),
              content: Text("${response.body}"),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("OK"))
              ],
            );
          });
    }
  }

  _put() async {
    var corpo = jsonEncode(
      {
        "userId": 120,
        "id": null,
        "title":
            "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
        "body": "Corpo da postagem"
      },
    );

    http.Response response = await http.put(_urlBase + "/posts/2",
        headers: {
          'Content-type': 'application/json; charset=UTF-8',
        },
        body: corpo);

    if (response.statusCode == 200) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Postagem realizada com sucesso"),
              content: Text("${response.body}"),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("OK"))
              ],
            );
          });
    }
  }

  _delete() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo de serviço avançado"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: _post, child: Text("Salvar")),
                ElevatedButton(onPressed: _put, child: Text("Editar")),
                ElevatedButton(onPressed: _delete, child: Text("Deletar")),
              ],
            ),
            Expanded(
                child: FutureBuilder<List<Post>>(
                    future: _recuperarPostagens(),
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                        case ConnectionState.waiting:
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                          break;
                        case ConnectionState.active:
                        case ConnectionState.done:
                          if (snapshot.hasError) {
                            print("lista: Erro ao carregar ");
                          } else {
                            return ListView.builder(
                                itemCount: snapshot.data?.length,
                                itemBuilder: (context, index) {
                                  List<Post>? lista = snapshot.data;
                                  Post post = lista![index];

                                  return ListTile(
                                    title: Text(post.title),
                                    subtitle: Text(post.id.toString()),
                                  );
                                });
                          }
                          break;
                      }
                      return CircularProgressIndicator();
                    }))
          ],
        ),
      ),
    );
  }
}
