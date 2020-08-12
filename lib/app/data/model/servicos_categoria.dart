class ServicosCategoria {
  List<Servicos> servicos;
  bool sucesso;
  String mensagemFinal;

  ServicosCategoria({this.servicos, this.sucesso, this.mensagemFinal});

  ServicosCategoria.fromJson(Map<String, dynamic> json) {
    if (json['servicos'] != null) {
      servicos = new List<Servicos>();
      json['servicos'].forEach((v) {
        servicos.add(new Servicos.fromJson(v));
      });
    }
    sucesso = json['sucesso'];
    mensagemFinal = json['mensagemFinal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.servicos != null) {
      data['servicos'] = this.servicos.map((v) => v.toJson()).toList();
    }
    data['sucesso'] = this.sucesso;
    data['mensagemFinal'] = this.mensagemFinal;
    return data;
  }
}

class Servicos {
  int id;
  String nome;

  Servicos({this.id, this.nome});

  Servicos.fromJson(Map<String, dynamic> json) {
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