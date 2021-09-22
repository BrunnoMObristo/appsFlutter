import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
 
  @override
  _HomeState createState() => _HomeState();
}
 
class _HomeState extends State<Home> {
  TextEditingController n1Controller = TextEditingController();
  TextEditingController n2Controller = TextEditingController();
 
  String infoResultado = "Informe os valores!";
 
  void _calcular() {
    setState(() {
      double precoAlcool = double.parse(n1Controller.text);
      double precoGasolina = double.parse(n2Controller.text);
 
      double resultado = (precoAlcool / precoGasolina);
 
      if(resultado <= 0.7){
        infoResultado = 'O álcool é a melhor opção';
      }else{
        infoResultado = 'A gasolina é a melhor opção';
      } 
      
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou gasolina"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Digite o valor do álcool",
                  labelStyle: TextStyle(color: Colors.red)),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 25.0),
              controller: n1Controller,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Digite o valor da gasolina",
                  labelStyle: TextStyle(color: Colors.red)),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 25.0),
              controller: n2Controller,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Container(
                height: 50.0,
                child: RaisedButton(
                  onPressed: _calcular,
                  child: Text("Calcular",
                      style: TextStyle(color: Colors.white, fontSize: 20.0)),
                  color: Colors.blue,
                ),
              ),
            ),
            Text(
              infoResultado,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.red, fontSize: 25.0),
            )
          ],
        ),
      ),
    );
  }
}