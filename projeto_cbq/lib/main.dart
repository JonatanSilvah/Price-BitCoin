import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projeto_cbq/Telas/SplashScream.dart';

import 'Rotas.dart';
import 'Telas/Login.dart';

final ThemeData temaPadrao =
    ThemeData(primaryColor: Color(0xffffc107), accentColor: Color(0xff70a83b));

Future<void> main(List<String> args) async {
 await Firebase.initializeApp();

  runApp(MaterialApp(
    theme: temaPadrao,
    title: "Colégio brasileiro de quiropraxia e terapias manuais",
    initialRoute: "/",
    onGenerateRoute: Rotas.gerarRotas,
    debugShowCheckedModeBanner: false,
    home: SplashScream(),
  ));
}
