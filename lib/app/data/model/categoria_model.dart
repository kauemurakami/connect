import 'package:connect/app/data/model/sub_categoria_model.dart';

class CategoriaModel {

  int idCategoria;
  String categoria;
  List<SubCategoriaModel> subCategorias;

  CategoriaModel({ this.categoria, this.idCategoria, this.subCategorias });

  CategoriaModel.fromJson(Map<String, dynamic> json){
      this.categoria = json['categoria'];
      this.idCategoria = json['idCategoria'];
      this.subCategorias = json['subCategorias'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoria'] = this.categoria;
    data['idCategoria'] = this.idCategoria;
    data['subCategorias'] = this.subCategorias;
    return data;
  }
}