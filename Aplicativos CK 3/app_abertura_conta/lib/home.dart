import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  TextEditingController nomeRecebido = TextEditingController();
  TextEditingController idadeRecebida = TextEditingController();  
   String dropdownSexo = 'Masculino';
   String dropdownEscolaridade = 'Ensino Fundamental';
   bool boolSwitch = true;
   double boolSlider = 0;


   String result = "";

  void _registrarDados() {
    String nome = nomeRecebido.text;
    double idade = double.parse(idadeRecebida.text);

    setState(() {
      result =
          "Nome: $nome" + "\n"
          "Idade: $idade" + "\n"
          "Sexo: $dropdownSexo" + "\n" 
          "Escolaridade: $dropdownEscolaridade" + "\n"
          "Meu limite: R\$ $boolSlider" + "\n"
          "Brasileiro: $boolSwitch";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _titulo(),
      body: _body(),
    );
  }

  _body() {
    return SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _text("Nome", nomeRecebido),
            _textNumber("Idade", idadeRecebida),
            _selectSexo(),
            _selectEscolaridade(),
            _slider(),
            _switch(),
            _botao(),
            _retornarDados(result),
          ],
        ));
  }

//Tentei usar um return Container pra inserir um padding,
//mas dependendo do conteúdo, a exibição ficava zoada.
  _retornarDados(resultadoExibicao) {
    return Text(
      resultadoExibicao,
      textAlign: TextAlign.left,
      style: TextStyle(color: Color.fromRGBO(211, 17, 25, 1), fontSize: 20.0),
    );
  }

  _titulo() {
    return AppBar(
      title: Text("C6 Bank"),
      centerTitle: true,
      backgroundColor: Color.fromRGBO(211, 17, 25, 1),
    );
  }

  _text(label, controller) {
    return TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: Color.fromRGBO(211, 17, 25, 1),
          )),
      style: TextStyle(color: Color.fromRGBO(211, 17, 25, 1), fontSize: 20.0),
      controller: controller,
    );
  }

  _textNumber(label, controller) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: Color.fromRGBO(211, 17, 25, 1),
          )),
      style: TextStyle(color: Color.fromRGBO(211, 17, 25, 1), fontSize: 20.0),
      controller: controller,
    );
  }

  _selectSexo() {
    return Container(
      padding: EdgeInsets.only(left: 130,top: 20, bottom: 10),
      child: DropdownButton<String>(
        value: dropdownSexo,
        iconSize: 34,
        style: TextStyle(color: Color.fromRGBO(211, 17, 25, 1), fontSize: 15),
        underline: Container(
          height: 1,
          color: Color.fromRGBO(211, 17, 25, 1),
        ),
        items: <String>['Masculino', 'Feminino', 'Indefinido'].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? valorSelecionado) {
          setState(() {
            dropdownSexo = valorSelecionado!;
          });
        },
      ),
    );
  }

  _selectEscolaridade() {
    return Container(
      padding: EdgeInsets.only(left: 107,top: 20, bottom: 10),
      child: DropdownButton<String>(
        value: dropdownEscolaridade,
        iconSize: 34,
        style: TextStyle(color: Color.fromRGBO(211, 17, 25, 1), fontSize: 15),
        underline: Container(
          height: 1,
          color: Color.fromRGBO(211, 17, 25, 1),
        ),
        items: <String>['Ensino Fundamental', 'Ensino Médio', 'Ensino Superior']
            .map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? valorSelecionado) {
          setState(() {
            dropdownEscolaridade = valorSelecionado!;
          });
        },
      ),
    );
  }

  _slider() {
    return Row(children: <Widget>[
      Text(
        "Meu limite: ",
        style: TextStyle(color: Color.fromRGBO(211, 17, 25, 1), fontSize: 17.0),
      ),
      Slider(
        value: boolSlider,
        min: 0,
        max: 5000,
        divisions: 100,
        label: boolSlider.round().toString(),
        onChanged: (double value) {
          setState(() {
            boolSlider = value;
          });
        },
      ),
    ]);
  }

  _switch() {
    return Row(children: <Widget>[
      Text(
        "Brasileiro: ",
        style: TextStyle(color: Color.fromRGBO(211, 17, 25, 1), fontSize: 17.0),
      ),
      Switch(
        value: boolSwitch,
        onChanged: (value) {
          setState(() {
            boolSwitch = value;
          });
        },
        activeTrackColor: Color.fromRGBO(211, 17, 25, .4),
        activeColor: Color.fromRGBO(211, 17, 25, 1),
      )
    ]);
  }

  _botao() {
    return Padding(
        padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
        child: Container(
            height: 50.0,
            width: 500,
            child: RaisedButton(
              onPressed: _registrarDados,
              child: Text("Verificar",
                  style: TextStyle(color: Colors.white, fontSize: 20.0)),
              color: Color.fromRGBO(211, 17, 25, 1),
            )));
  }
}