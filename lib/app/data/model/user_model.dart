import 'package:connect/app/data/model/servico_model.dart';

class UserModel {
  //tipo: 1 = Empresas , 2 = Prestadores

  String id;
  String tipo;
  String telefone;
  String cnpjOrCpf;
  String nome;
  String cidade;
  String email;
  String senha;
  String endereco;
  String estado;
  int favorito;
  bool statusPagamento;
  List<ServicoModel> servicos;
  UserModel(
      {this.servicos,
      this.favorito,
      this.id,
      this.nome,
      this.email,
      this.senha,
      this.cidade,
      this.cnpjOrCpf,
      this.endereco,
      this.estado,
      this.telefone,
      this.tipo,
      this.statusPagamento = false});

  UserModel.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.tipo = json['tipoLogin'];
    this.telefone = json['telefone'];
    this.cnpjOrCpf = json['cnpj_or_cpf'];
    this.nome = json['nome_empresa'];
    this.cidade = json['cidade'];
    this.estado = json['estado'];
    this.endereco = json['endereco'];
    this.email = json['email'];
    this.senha = json['senha'];
    this.statusPagamento = json['mensalidade'];
    this.favorito = json['favorito'];
    this.servicos = json['servicos'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idUsuario'] = this.id;
    data['tipoLogin'] = this.tipo;
    data['telefone'] = this.telefone;
    data['cnpj_or_cpf'] = this.cnpjOrCpf;
    data['nome_empresa'] = this.nome;
    data['cidade'] = this.cidade;
    data['estado'] = this.estado;
    data['endereco'] = this.endereco;
    data['email'] = this.email;
    data['senha'] = this.senha;
    data['mensalidade'] = this.statusPagamento;
    data['favorito'] = this.statusPagamento;
    data['servicos'] = this.servicos;

    return data;
  }
}
