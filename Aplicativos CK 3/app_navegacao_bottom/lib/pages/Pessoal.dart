import 'package:flutter/material.dart';
 
class Pessoal extends StatelessWidget {
  const Pessoal({Key? key}) : super(key: key);
 
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
          _texto("Meu nome é Brunno Martyres Obristo"),     
          _texto("Tenho 20 anos, embora não pareça"),
          _texto("Meu esporte favorito é Basquete. Gosto bastante de jogos, jogo sempre que tenho um tempinho"),
          _texto("Acho que não tenho um sonho definido, mas o que eu mais quero no momento é aprender a tocar guitarra"),
          _texto("Meu álbum favorito atualmente é o MONTERO, de Lil Nas X. Esse álbum tem significado muito pra mim.")
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
