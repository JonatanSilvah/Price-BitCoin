import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart' as htpp;
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _resultado = "Clique em atualizar, para mostrar o preço";
  _preco() async {
    String url = "https://blockchain.info/ticker";

    htpp.Response response;

    response = await htpp.get(url);

    Map<String, dynamic> retorno = json.decode(response.body);
    setState(() {
      _resultado = retorno["BRL"]["sell"].toString();
    });
  }

  Future<Map> _recuperarPreco() async {
    String url = "https://blockchain.info/ticker";
    htpp.Response response = await htpp.get(url);

    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _recuperarPreco(),
        builder: ((context, snapshot) {
          String resultado = "Aguardando resultado";
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              resultado = "Carregando ...";
              break;
            case ConnectionState.done:
              if (snapshot.hasError) {
                resultado = "Erro ao carregar Resultado";
              } else {
                double valor = snapshot.data?["BRL"]["buy"];
                resultado = "${valor.toString()}";
              }
              break;
          }

          return Scaffold(
            body: Container(
              padding: EdgeInsets.all(20),
              height: double.infinity,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("images/bitcoin.png"),
                  Gap(20),
                  Text(
                    "R\$: $resultado",
                    style: TextStyle(fontSize: 25),
                  ),
                  Gap(20),
                  ElevatedButton(
                    onPressed: () {
                      _preco();
                    },
                    child: Text("Atualizar"),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.only(
                          left: 25, right: 25, top: 15, bottom: 15),
                      primary: Colors.orange,
                    ),
                  )
                ],
              ),
            ),
          );
        }));
  }
}
