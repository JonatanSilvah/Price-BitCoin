import 'package:flutter/material.dart';

import 'Telas/Cadastro.dart';
import 'Telas/Login.dart';

class Rotas {
  static const String ROTA_CADASTRO = "/cadastro";

  static Route<dynamic> gerarRotas(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: ((_) => Login()));
      case ROTA_CADASTRO:
        return MaterialPageRoute(builder: ((_) => Cadastro()));
      default:
        _erroRota();
    }
    return gerarRotas(settings);
  }

  static Route<dynamic> _erroRota() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Tela não encontrada"),
        ),
        body: Center(child: Text("Tela não encontrada")),
      );
    });
  }
}
