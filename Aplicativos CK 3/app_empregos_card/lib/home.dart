import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _titulo(),
      body: _body(),
    );
  }

  _titulo() {
    return AppBar(
      title: Text("Vagas disponíveis"),      
      backgroundColor: Colors.purple,
    );
  }

  _body() {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            _card("Vaga 1", "1980,00", "Descrição 1", "(99) 9999-9999", "https://www.instagram.com/smino/?hl=pt"),
            _card("Vaga 2", "2500,00", "Descrição 2", "(99) 9999-9999", "https://pt.wikipedia.org/wiki/Shin_Megami_Tensei"),
            _card("Vaga 3", "3500,00", "Descrição 3", "(99) 9999-9999", "https://www.sonicthehedgehog.com/"),
            _card("Vaga 4", "1000,00", "Descrição 4", "(99) 9999-9999", "https://teamninja-studio.com/doa6/"),
            _card("Vaga 5", "1500,00", "Descrição 5", "(99) 9999-9999", "https://www.instagram.com/lilnasx/"),
            _card("Vaga 6", "2200,00", "Descrição 6", "(99) 9999-9999", "https://sabapivot.com/"),           
          ],
        ),
      ),
    );
  }

  _tituloCard(titulo) {
    return Text(
      titulo,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30,
        color: Color.fromRGBO(52, 168, 234, 1),
      ),
    );
  }

  _textoSalario(salario) {
    return Text(
      salario,
      style: TextStyle(
        fontSize: 20,        
      ),
    );
  }

  _textoDescricao(descricao) {
    return Text(
      descricao,
      style: TextStyle(
        fontSize: 20,
      ),
    );
  }

  _textoContato(contato) {
    return Text(
      contato,
      style: TextStyle(
        fontSize: 20,
      ),
    );
  }

  _textoSite(url){
    return Text(
      url,
      style: TextStyle(
        fontSize: 20
      )
    );
  }

  _card(titulo, salario, descricao, contato, site) {
    return Container(
      color: Color.fromRGBO(206, 104, 247, .5),
      width: 550,
      height: 170,
      margin: EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _tituloCard(titulo),
          _textoSalario("Salário: R\$ $salario"),
          _textoDescricao("Descrição: $descricao"),
          _textoContato("Contato: $contato"),
          _textoSite("$site")
        ],
      ),
    );
  }
}