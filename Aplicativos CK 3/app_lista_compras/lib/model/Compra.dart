
class Compra {
  int id;
  String titulo;
  String descricao;
  String data;
  String quantidade;
 
  Compra(this.titulo, this.descricao, this.data, this.quantidade);
 
  Compra.fromMap(Map map) {
    this.id = map["id"];
    this.titulo = map["titulo"];
    this.descricao = map["descricao"];
    this.data = map["data"];
    this.quantidade = map["quantidade"];
  }
 
  Map toMap() {
    Map<String, dynamic> map = {
      "titulo": this.titulo,
      "descricao": this.descricao,
      "data": this.data,
      "quantidade": this.quantidade
    };
 
    if (this.id != null) {
      map["id"] = this.id;
    }
 
    return map;
  }
}
