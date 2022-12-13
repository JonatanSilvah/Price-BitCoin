import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:projeto_cbq/Telas/InputCustomizado.dart';
import 'package:projeto_cbq/Rotas.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  AnimationController? _controller;

  Animation<double>? _animacaoSize;
  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    _animacaoSize = Tween<double>(begin: 0, end: 500).animate(
        CurvedAnimation(parent: _controller!, curve: Curves.decelerate));

    _controller!.forward();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 350,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "images/logoCBQ.png",
                      ),
                      fit: BoxFit.contain),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Column(
                  children: [
                    AnimatedBuilder(
                        animation: _animacaoSize!,
                        builder: (context, widget) {
                          return Container(
                            width: _animacaoSize!.value,
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 15,
                                      spreadRadius: 4)
                                ]),
                            child: Column(
                              children: [
                                InputCustomizado(
                                  hint: "E-mail",
                                ),
                                InputCustomizado(
                                  hint: "senha",
                                  obscure: true,
                                  icon: Icon(Icons.lock),
                                )
                              ],
                            ),
                          );
                        }),
                    Gap(20),
                    AnimatedBuilder(
                      animation: _animacaoSize!,
                      builder: (context, child) {
                        return InkWell(
                          onTap: () {},
                          child: Container(
                            height: 50,
                            width: _animacaoSize!.value,
                            child: Center(
                                child: Text(
                              "Entrar",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(colors: [
                                  Color(0xffffc107),
                                  Color(0xffffc107)
                                ])),
                          ),
                        );
                      },
                    ),
                    Gap(12),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/cadastro");
                      },
                      child: Container(
                        height: 50,
                        child: Center(
                            child: Text(
                          "Cadastrar",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(colors: [
                              Color(0xffffc107),
                              Color(0xffffc107)
                            ])),
                      ),
                    ),
                    Gap(12),
                    Text(
                      "Esqueci minha senha",
                      style: TextStyle(
                          color: Color(0xffffc107),
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
