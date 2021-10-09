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
      body: _corpo(),
    );
  }

  _titulo() {
    return AppBar(
      title: Text("Anúncios de Emprego"),
      centerTitle: true,
      backgroundColor: Color.fromRGBO(246, 244, 253, 1),
    );
  }

  _corpo() {
    return Container(
      child: PageView(
        children: <Widget>[
          _containerFotoEAnuncio('adm.jpeg', 
                                "Anúncio N°1"),
          _containerFotoEAnuncio('bozo.jpg', 
                                "Anúncio N°2"),
          _containerFotoEAnuncio('nando.jpg', 
                                "Anúncio N°3")
        ],
      ),
    );
  }

  _imgAnuncio(String titulo) {
    return Image.asset(
       "assets/images/$titulo",       
      width: 500,
      height: 500,      
      fit: BoxFit.cover,
    );
  }

  _containerFotoEAnuncio(path, txtAnuncio) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        //mainAxisAlignment: MainAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,

        children: <Widget>[
          _imgAnuncio(path),
          Text(txtAnuncio, 
              style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }

  
}