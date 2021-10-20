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

  TextEditingController valorController = TextEditingController();
  String selectValor = "Dólar";
  String selectValor2 = "Euro";
  String resultadoConversao = "";

  //Euro = 6,22
  //Dolar = 5,37
  void _converter() {
    setState(() {
      double num = double.parse(valorController.text);
      String valorDrop = 'Dólar Real Euro';

      //Real
      if (selectValor == "Real" && selectValor2 == "Dólar") {
        double calculo = (num / 5.37);
        resultadoConversao = "$calculo de Dólares";
      }
      if (selectValor == "Real" && selectValor2 == "Euro") {
        double calculo = (num / 6.22);
        resultadoConversao = "$calculo Euros";
      }

      //Dólar 
      if (selectValor == "Dólar" && selectValor2 == "Real") {
        double calculo = (num * 5.37);
        resultadoConversao = "$calculo Reais";        
      }
      if (selectValor == "Dólar" && selectValor2 == "Euro") {
        double calculo = (num * 0.86);
        resultadoConversao = "$calculo Euros";
      }

      //Euro
      if (selectValor == "Euro" && selectValor2 == "Real") {
        double calculo = (num * 6.22);
        resultadoConversao = "$calculo Reais";
      }
      if (selectValor == "Euro" && selectValor2 == "Dólar") {
        double calculo = (num * 1.16);
        resultadoConversao = "$calculo Dólares";
      }
    });
  }

  
_titulo() {
    return AppBar(
      title: Text("Conversor de Moedas Dólar, Real e Euro"),
      backgroundColor: Colors.purple,
    );
  }

  _body() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(
        
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          _textField(),
          _selectValor1(),
          _selectValor2(),
          _botaoSubmit(),
          Text(
            "O resultado da conversão é: $resultadoConversao",
            style: TextStyle(fontSize: 30, color: Colors.green)
          ),
        ],
      ),
    );
  }

  

  _textField() {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: "Valor para conversão", labelStyle: TextStyle(color: Colors.black)),
      textAlign: TextAlign.left,
      style: TextStyle(color: Colors.black, fontSize: 25.0),
      controller: valorController,
    );
  }

  _selectValor1() {
    return DropdownButton<String>(
      value: selectValor,
      items: <String>['Dólar', 'Real', 'Euro'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? valorSelecionado) {
        setState(() {
         selectValor = valorSelecionado!;
        });
      },
      isExpanded: true,
      style:TextStyle(color:Colors.black, fontSize: 26),
    );
  }

  _selectValor2() {
    return DropdownButton<String>(
      value: selectValor2,
      items: <String>['Dólar', 'Real', 'Euro'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? value) {
        setState(() {
          selectValor2 = value!;
        });
      },
        isExpanded: true,
        style:TextStyle(color:Colors.black, fontSize: 26),
    );
  }

//Tentei usar elevatedButton, mas achei RaisedButton mais fácil pra aplicar props
  _botaoSubmit() {
    return RaisedButton(
      color: Colors.red,
      onPressed: _converter,
      child: Text(
        "Converter",
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
        ),
      ),
    );
  }
}