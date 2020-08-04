class CategoriasModel {
  List<Categorias> categorias;
  String sucesso;
  String mensagemErro;

  CategoriasModel({this.categorias, this.sucesso, this.mensagemErro});

  CategoriasModel.fromJson(Map<String, dynamic> json) {
    if (json['categorias'] != null) {
      categorias = new List<Categorias>();
      json['categorias'].forEach((v) {
        categorias.add(new Categorias.fromJson(v));
      });
    }
    sucesso = json['sucesso'];
    mensagemErro = json['mensagemErro'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categorias != null) {
      data['categorias'] = this.categorias.map((v) => v.toJson()).toList();
    }
    data['sucesso'] = this.sucesso;
    data['mensagemErro'] = this.mensagemErro;
    return data;
  }
}

class Categorias {
  String categoria;
  String idCategoria;
  List<SubCategorias> subCategorias;

  Categorias({this.categoria, this.idCategoria, this.subCategorias});

  Categorias.fromJson(Map<String, dynamic> json) {
    categoria = json['categoria'];
    idCategoria = json['idCategoria'];
    if (json['subCategorias'] != null) {
      subCategorias = new List<SubCategorias>();
      json['subCategorias'].forEach((v) {
        subCategorias.add(new SubCategorias.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoria'] = this.categoria;
    data['idCategoria'] = this.idCategoria;
    if (this.subCategorias != null) {
      data['subCategorias'] =
          this.subCategorias.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubCategorias {
  String nome;
  String idSubCategoria;

  SubCategorias({this.nome, this.idSubCategoria});

  SubCategorias.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    idSubCategoria = json['idSubCategoria'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['idSubCategoria'] = this.idSubCategoria;
    return data;
  }
}
