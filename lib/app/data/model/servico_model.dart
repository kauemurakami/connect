
import 'package:connect/app/data/model/categoria_model.dart';

class ServicoModel {

  String nome;
  int id;
  String status;
  String data;
  CategoriaModel categoria;

  ServicoModel({this.id, this.nome, this.categoria, this.data, this.status });
  
  ServicoModel.fromJson(Map<String, dynamic> json){
      this.id = json['id'];
      this.nome = json['nome'];
      this.data = json['data'];
      this.categoria = json['categoria'];
      this.status = json['status'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['categoria'] = this.categoria;
    data['status'] = this.status;
    data['data'] = this.data;
    return data;
  }
}