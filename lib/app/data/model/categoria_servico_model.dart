class CategoriasServicoModel {
  List<CategoriaServicos> categoriaServicos;

  CategoriasServicoModel({this.categoriaServicos});

  CategoriasServicoModel.fromJson(Map<String, dynamic> json) {
    if (json['categoriaServicos'] != null) {
      categoriaServicos = new List<CategoriaServicos>();
      json['categoriaServicos'].forEach((v) {
        categoriaServicos.add(new CategoriaServicos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categoriaServicos != null) {
      data['categoriaServicos'] =
          this.categoriaServicos.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoriaServicos {
  int id;
  String nome;

  CategoriaServicos({this.id, this.nome});

  CategoriaServicos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    return data;
  }
}