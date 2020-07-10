import 'package:connect/app/data/model/categoria_model.dart';
import 'package:connect/app/data/model/prestador_model.dart';
import 'categoria_model.dart';

class ServicoModel {

  String nome;
  int id;
  String status;
  String data;
  String descricao;
  CategoriaModel categoria;
  PrestadorModel prestador;

  ServicoModel({ this.id, this.nome, this.categoria, this.data, this.status, this.prestador, this.descricao });
  
  ServicoModel.fromJson(Map<String, dynamic> json){
      this.id = json['id'];
      this.nome = json['nome'];
      this.data = json['data'];
      this.categoria = json['categoria'];
      this.status = json['status'];
      this.prestador = json['prestador'];
      this.descricao = json['descricao'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['categoria'] = this.categoria;
    data['status'] = this.status;
    data['data'] = this.data;
    data['prestador'] = this.prestador;
    data['descricao'] = this.descricao;
    return data;
  }
}