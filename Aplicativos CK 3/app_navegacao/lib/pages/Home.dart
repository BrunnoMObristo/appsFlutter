import 'package:flutter/material.dart';
import 'package:app_navegacao/pages/Formacao.dart';
import 'package:app_navegacao/pages/Experiencia.dart';
import 'package:app_navegacao/pages/Pessoal.dart';
 
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
 
  @override
  _HomeState createState() => _HomeState();
}
 
class _HomeState extends State<Home> {
  int _currentPage = 1;
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: _appBar("App sobre mim"),
        backgroundColor: Colors.white,
        body: _body(),
        drawer: Drawer(
            child: ListView(
          children: [
            Icon(Icons.ac_unit),
            _titulo("Brunno Martyres Obristo"),
            ListTile(
              //leading: Icon(Icons.star),
              title: Text('Home'),
              subtitle: Text('Tela inicial do App'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                setState(() {
                  _currentPage = 1;
                });
              },
            ),
            ListTile(
              //leading: Icon(Icons.star),
              title: Text('Pessoal'),
              subtitle: Text('Tela de informações pessoais'),
              trailing: Icon(Icons.account_box_outlined),
              onTap: () {
                setState(() {
                  _currentPage = 2;
                });
              },
            ),
            ListTile(
              //leading: Icon(Icons.star),
              title: Text('Experiência'),
              subtitle: Text('Tela de experiência'),
              trailing: Icon(Icons.contact_mail_rounded),
              onTap: () {
                setState(() {
                  _currentPage = 3;
                });
              },
            ),
            ListTile(
              //leading: Icon(Icons.star),
              title: Text('Formação'),
              subtitle: Text('Tela de informações sobre formação'),
              trailing: Icon(Icons.contact_mail_rounded),
              onTap: () {
                setState(() {
                  _currentPage = 4;
                });
              },
            )
          ],
        )),
      ),
    );
  }
 
  _appBar(texto) {
    return AppBar(
      title: Text(texto),
      centerTitle: true,
      backgroundColor: Colors.green,
    );
  }

  _titulo(texto){
    return Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Text(texto,
            style: TextStyle(fontSize: 22)));
  }
  
 
  _body() {
    if (_currentPage == 1) {
     return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _texto("Neste APP estão contidas as informações sobre mim e minha formação/experiência profissional"),
          _texto("Este App foi desenvolvido nas aulas de Mobile dirigidas pelo professor Joseffe.")  
        ],
      ),
    );
    } else if (_currentPage == 2) {
      return Pessoal();
    } else if(_currentPage == 3){
      return Experiencia();
    }else{
      return Formacao();
    }
  }

  _texto(texto) {    
   return Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Text(texto,
            style: TextStyle(fontSize: 22)));
  }
}
