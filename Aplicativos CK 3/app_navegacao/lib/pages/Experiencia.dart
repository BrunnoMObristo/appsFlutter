import 'package:flutter/material.dart';
 
class Experiencia extends StatelessWidget {
  const Experiencia({Key? key}) : super(key: key);
 
 @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: _body(context),
    );
  }
 
  _body(BuildContext context) {
     return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _texto("Sou formado em Técnico de Informática pela ETEC Horácio Augusto da Silveira."),     
          _texto("Adquiri meu primeiro emprego a partir da recomendação de um professor, onde trabalhei como full stack por dois anos. Mas fui demitido devido à pandemia."),
          _texto("Atualmente trabalho numa empresa chamada Moderna Sistemas, uma empresa do ramo de desenvolvimento de sistemas relacionados à área da saúde."),
          _texto("Atualmente também curso Sistemas para Internet na Faculdade FIAP")
        ],
      ),
    );
  }

  _texto(texto) {    
   return Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Text(texto,
            style: TextStyle(fontSize: 22)));
  }
}
