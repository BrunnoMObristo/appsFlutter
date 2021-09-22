import 'package:flutter/material.dart';
import 'dart:math';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController n1Controller = TextEditingController();
  String numeroSorteado = "";

  void _sortearNumero() {
    setState(() {
      int numero = new Random().nextInt(10);
      numeroSorteado = "$numero";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _title(),
      body: _body(),
      backgroundColor: Colors.white,
    );
  }

  _title() {
    return AppBar(
      title: Text("Sorteio de Número"),
      centerTitle: true,
      backgroundColor: Colors.purple,
    );
  }

  _texto(label) {
    return Text(label,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.red, fontSize: 25.0));
  }

  _body() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _texto("Clique no botão para sortear um número"),     
          _texto(numeroSorteado),
          _botao(),
        ],
      ),
    );
  }

  _botao() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Container(
        height: 50.0,
        child: RaisedButton(
          onPressed: _sortearNumero,
          child: Text("Sortear",
              style: TextStyle(color: Colors.white, fontSize: 30.0)),
          color: Colors.black,
        ),
      ),
    );
  }

 
}