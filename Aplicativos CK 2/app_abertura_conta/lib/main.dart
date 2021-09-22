import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home());
  }
}
 
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
 
  @override
  _HomeState createState() => _HomeState();
}
 
class _HomeState extends State<Home> {
  bool valorSwitch = false;
  String dropdownValor = "Frango";
  TextEditingController n1Controller = TextEditingController();
  double valorSlider = 0;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: _titulo(),
        backgroundColor: Colors.white,
        body: _corpo(),
      ),
    );
  }
 
  _titulo() {
    return AppBar(
      title: Text("Componentes"),
      centerTitle: true,
      backgroundColor: Colors.green,
    );
  }
 
  _corpo() {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _textField("Nome"),
            _textField("Idade"),
            _dropdown("1", ['A', 'B', 'C', 'D']),
            _dropdown("2", ["Teste 1", "Teste 2", "Teste 3", "Teste 4"]),
            _slider(),
            _switch(),
            _texto(valorSwitch.toString()),
          ],
        ),
      ),
    );
  }
 
  _textField(String label){
    return TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: label,
                  labelStyle: TextStyle(color: Colors.red)),
              textAlign: TextAlign.center,            
              style: TextStyle(color: Colors.black, fontSize: 25.0),
              controller: n1Controller,
    );
          
  }

  _texto(String valor) {
    return Text(
      valor,
      style: TextStyle(
          color: Colors.blue,
          fontSize: 30,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          decoration: TextDecoration.underline,
          decorationColor: Colors.red,
          decorationStyle: TextDecorationStyle.wavy),
    );
  }
 
  _switch() {
    return Switch(
      value: valorSwitch,
      onChanged: (value) {
        setState(() {
          valorSwitch = value;
        });
      },
      activeTrackColor: Colors.lightGreenAccent,
      activeColor: Colors.blue,
    );
  }

  _dropdown(String controller, List<String> valores) {
    return DropdownButton<String>(
      //value: dropdownValor,
      items: <String>[valores[0].toString(), valores[1].toString(), valores[2].toString()]
          .map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? value) {
        setState(() {
          dropdownValor = valores.indexOf(value!) as String;
        });
      },
      
    );
  }

_slider() {
    return Slider(
      value: valorSlider,
      min: 0,
      max: 100,
      divisions: 100,
      label: valorSlider.round().toString(),
      onChanged: (double value) {
        setState(() {
          valorSlider = value;
        });
      },
    );
  }


}
