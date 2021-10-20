import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'helper/CompraHelper.dart';
import 'model/Compra.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
 
class _HomeState extends State<Home> {
  TextEditingController _tituloController = TextEditingController();
  TextEditingController _descricaoController = TextEditingController();
  TextEditingController _quantidadeController = TextEditingController();
  var _db = CompraHelper();
  List<Compra> _compras = List<Compra>();
 
  _exibirTelaCadastro({Compra compra}) {
    String textoSalvarAtualizar = "";
    if (compra == null) {
      //salvando
      _tituloController.text = "";
      _descricaoController.text = "";
      _quantidadeController.text = "";
      textoSalvarAtualizar = "Salvar";
    } else {
      //atualizar
      _tituloController.text = compra.titulo;
      _descricaoController.text = compra.descricao;
      _quantidadeController.text = compra.quantidade;
      textoSalvarAtualizar = "Atualizar";
    }
 
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("$textoSalvarAtualizar compra"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  controller: _tituloController,
                  autofocus: true,
                  decoration: InputDecoration(
                      labelText: "Título do item", hintText: "Digite título..."),
                ),
                TextField(
                  controller: _descricaoController,
                  decoration: InputDecoration(
                      labelText: "Descrição do item", hintText: "Digite descrição..."),
                ),
                TextField(
                  controller: _quantidadeController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Quantidade do item", hintText: "Digite quantidade..."),
                )
              ],
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancelar")),
              FlatButton(
                  onPressed: () {
                    //salvar
                    _salvarAtualizarCompra(compraSelecionada: compra);
 
                    Navigator.pop(context);
                  },
                  child: Text(textoSalvarAtualizar))
            ],
          );
        });
  }
 
  _recuperarCompras() async {
    List comprasRecuperadas = await  _db.recuperarCompras();
 
    List<Compra> listaTemporaria = List<Compra>();
    for (var item in comprasRecuperadas) {
      Compra compra = Compra.fromMap(item);
      listaTemporaria.add(compra);
    }
 
    setState(() {
      _compras = listaTemporaria;
    });
    listaTemporaria = null;
 
    //print("Lista anotacoes: " + anotacoesRecuperadas.toString() );
  }
 
  _salvarAtualizarCompra({Compra compraSelecionada}) async {
    String titulo = _tituloController.text;
    String descricao = _descricaoController.text;
    String quantidade = _quantidadeController.text;
 
    if (compraSelecionada == null) {
      //salvar
      Compra compra =
          Compra(titulo, descricao, DateTime.now().toString(), quantidade);
      int resultado = await _db.salvarCompra(compra);
    } else {
      //atualizar
      compraSelecionada.titulo = titulo;
      compraSelecionada.descricao = descricao;
      compraSelecionada.data = DateTime.now().toString();
      compraSelecionada.quantidade = quantidade;
      int resultado = await _db.atualizarCompra(compraSelecionada);
    }
 
    _tituloController.clear();
    _descricaoController.clear();
 
    _recuperarCompras();
  }
 
  _formatarData(String data) {
    initializeDateFormatting("pt_BR");
 
    //Year -> y month-> M Day -> d
    // Hour -> H minute -> m second -> s
    //var formatador = DateFormat("d/MMMM/y H:m:s");
    var formatador = DateFormat.yMd("pt_BR");
 
    DateTime dataConvertida = DateTime.parse(data);
    String dataFormatada = formatador.format(dataConvertida);
 
    return dataFormatada;
  }
 
  _removerAnotacao(int id) async {
    await _db.removerCompra(id);
 
    _recuperarCompras();
  }
 
  @override
  void initState() {
    super.initState();
    _recuperarCompras();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Compras"),
        backgroundColor: Colors.redAccent[700],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: ListView.builder(
                  itemCount: _compras.length,
                  itemBuilder: (context, index) {
                    final compra = _compras[index];
 
                    return Card(
                      child: ListTile(
                        title: Text(compra.titulo),
                        subtitle: Text(
                            "${_formatarData(compra.data)} - ${compra.descricao} - ${compra.quantidade}"),

                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                _exibirTelaCadastro(compra: compra);
                              },
                              child: Padding(
                                padding: EdgeInsets.only(right: 16),
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                _removerAnotacao(compra.id);
                              },
                              child: Padding(
                                padding: EdgeInsets.only(right: 0),
                                child: Icon(
                                  Icons.remove_circle,
                                  color: Colors.red,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }))
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          child: Icon(Icons.add),
          onPressed: () {
            _exibirTelaCadastro();
          }),
    );
  }
}
