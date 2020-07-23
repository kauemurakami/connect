class SubCategoriaModel {

  int idSubCategoria;
  String nome;

  SubCategoriaModel({ id, name });

  SubCategoriaModel.fromJson(Map<String, dynamic> json){
      this.idSubCategoria = json['idSubCategoria'];
      this.nome = json['nome'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['idSubCategoria'] = this.idSubCategoria;
    return data;
  }
}