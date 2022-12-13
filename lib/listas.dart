import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  const ListaPage({super.key});

  @override
  State<ListaPage> createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  List _itens = [];
  void _carregarItens() {
    _itens = [];
    for (int i = 0; i <= 10; i++) {
      Map<String, dynamic> item = Map();
      item["Titulo"] = "Titulo ${i}";
      _itens.add(item);
    }
  }

  void _deleteItem() {
    _itens.remove(["Titulo"]);
    _itens.remove(["Subtitulo"]);
  }

  @override
  Widget build(BuildContext context) {
    _carregarItens();
    return Scaffold(
      appBar: AppBar(
        title: Text("Listas"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
          child: ListView.builder(
              itemCount: _itens.length,
              itemBuilder: (context, indice) {
                return ListTile(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(_itens[indice]["Titulo"]),
                              content: Text(_itens[indice]["Subtitulo"]),
                              actions: [
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("Sim")),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    }, child: Text("Não"))
                              ],
                            );
                          });
                    },
                    title: Text(_itens[indice]["Titulo"]),
                    subtitle: Text(_itens[indice]["Subtitulo"]));
              })),
    );
  }
}
