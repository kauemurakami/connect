class Cadastro {
  List<Cadastros> cadastros;
  bool sucesso;
  String mensagemFinal;

  Cadastro({this.cadastros, this.sucesso, this.mensagemFinal});

  Cadastro.fromJson(Map<String, dynamic> json) {
    if (json['cadastros'] != null) {
      cadastros = new List<Cadastros>();
      json['cadastros'].forEach((v) {
        cadastros.add(new Cadastros.fromJson(v));
      });
    }
    sucesso = json['sucesso'];
    mensagemFinal = json['mensagemFinal'];
   
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cadastros != null) {
      data['cadastros'] = this.cadastros.map((v) => v.toJson()).toList();
    }
    data['sucesso'] = this.sucesso;
  
    return data;
  }
}

class Cadastros {
  int id;
  int tipoCadastro;
  String nome;
  String cidade;
  int favorito;
  String imgPerfil;
  List<Servicos> servicos;

  Cadastros(
      {this.id,
      this.tipoCadastro,
      this.nome,
      this.cidade,
      this.favorito,
      this.imgPerfil,
      this.servicos});

  Cadastros.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tipoCadastro = json['tipoCadastro'];
    nome = json['nome'];
    cidade = json['cidade'];
    favorito = json['favorito'];
    imgPerfil = json['imgPerfil'];
    if (json['servicos'] != null) {
      servicos = new List<Servicos>();
      json['servicos'].forEach((v) {
        servicos.add(new Servicos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tipoCadastro'] = this.tipoCadastro;
    data['nome'] = this.nome;
    data['cidade'] = this.cidade;
    data['favorito'] = this.favorito;
    data['imgPerfil'] = this.imgPerfil;
    if (this.servicos != null) {
      data['servicos'] = this.servicos.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Servicos {
  int idServico;
  String nomeServico;
  String categoriaServico;
  int idCategoriaServico;
  String descricao;
  int disponivel;
  String imagem;

  Servicos(
      {this.idServico,
      this.nomeServico,
      this.categoriaServico,
      this.idCategoriaServico,
      this.descricao,
      this.disponivel,
      this.imagem});

  Servicos.fromJson(Map<String, dynamic> json) {
    idServico = json['idServico'];
    nomeServico = json['nomeServico'];
    categoriaServico = json['categoriaServico'];
    idCategoriaServico = json['idCategoriaServico'];
    descricao = json['descricao'];
    disponivel = json['disponivel'];
    imagem = json['imagem'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idServico'] = this.idServico;
    data['nomeServico'] = this.nomeServico;
    data['categoriaServico'] = this.categoriaServico;
    data['idCategoriaServico'] = this.idCategoriaServico;
    data['descricao'] = this.descricao;
    data['disponivel'] = this.disponivel;
    data['imagem'] = this.imagem;
    return data;
  }
}
