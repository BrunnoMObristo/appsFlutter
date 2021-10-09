import 'package:flutter/material.dart';
 
class Formacao extends StatelessWidget {
  const Formacao({Key? key}) : super(key: key);
 
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
          _texto("Técnico de Informática - ETEC Horácio Augusto Da Silveira"),     
          _texto("Full Stack (2 anos) - 3° Quadrante"),
          _texto("Full Stack (1 ano - Emprego atual) - Moderna Sistemas"),
          _texto("Sistemas para Internet - FIAP")
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
