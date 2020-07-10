import 'package:connect/app/data/model/categoria_model.dart';
import 'package:connect/app/data/model/servico_model.dart';
import 'package:get/get.dart';

class RxPrestador {
  final id = 0.obs;
  final nome = 'Prestador Nome'.obs;
  final telefone = '34988886654'.obs;
  final endereco = 'Rua nome 0'.obs;
  final cnpj = '9867531'.obs;
  final ramo = 'limpeza';
  final servicos = [
    ServicoModel(
      id: 64363,
        nome: 'Limpeza de tubulações',
        categoria: CategoriaModel(nome: 'Limpeza'),
        data: '13 de agosto',
        descricao:
            'Trabalhamos na área a mais 10 anos, sempre prestando o melhor serviço para melhor lhe atender',
            prestador: PrestadorModel(nome: 'Kauê Murakami', cnpj: '31234221', endereco: 'Rua Numero 0', telefone: '0349123456')),
    ServicoModel(
      id: 263262,
        nome: 'Limpeza galerias',
        categoria: CategoriaModel(nome: 'Limpeza'),
        data: '24 de junho',
        descricao:
            'Trabalhamos na área a mais 10 anos, sempre prestando o melhor serviço para melhor lhe atender',
            prestador: PrestadorModel(nome: 'Kauê Murakami', cnpj: '31234221', endereco: 'Rua Numero 0', telefone: '0349123456')),
    ServicoModel(
      id: 513253,
        nome: 'Mecânica pesada',
        categoria: CategoriaModel(nome: 'Automóveis'),
        data: '25 de julho',
        descricao:
            'Trabalhamos na área a mais 10 anos, sempre prestando o melhor serviço para melhor lhe atender',
            prestador: PrestadorModel(nome: 'Kauê Murakami', cnpj: '31234221', endereco: 'Rua Numero 0', telefone: '0349123456')),
    ServicoModel(
      id: 53253,
        nome: 'Mecânica de carros',
        categoria: CategoriaModel(nome: 'Automóveis'),
        data: '12 de outubro',
        descricao:
            'Trabalhamos na área a mais 10 anos, sempre prestando o melhor serviço para melhor lhe atender',
            prestador: PrestadorModel(nome: 'Kauê Murakami', cnpj: '31234221', endereco: 'Rua Numero 0', telefone: '0349123456')),
    ServicoModel(
      id: 21412,
        nome: 'Pinturas',
        categoria: CategoriaModel(nome: 'Construção cívil'),
        data: '01 de setembro',
        descricao:
            'Trabalhamos na área a mais 10 anos, sempre prestando o melhor serviço para melhor lhe atender',
            prestador: PrestadorModel(nome: 'Kauê Murakami', cnpj: '31234221', endereco: 'Rua Numero 0', telefone: '0349123456')),
    ServicoModel(
      id: 321312,
        nome: 'Reformas em piscinas',
        categoria: CategoriaModel(nome: 'Construção cívil'),
        data: '03 de novembro',
        descricao:
            'Trabalhamos na área a mais 10 anos, sempre prestando o melhor serviço para melhor lhe atender',
            prestador: PrestadorModel(nome: 'Kauê Murakami', cnpj: '31234221', endereco: 'Rua Numero 0', telefone: '0349123456'), ),
  ].obs;
}

class PrestadorModel {
  int id;
  String nome;
  String telefone;
  String endereco;
  String cnpj;
  String ramo;
  List<ServicoModel> servicos;

  PrestadorModel(
      {this.id,
      this.nome,
      this.telefone,
      this.cnpj,
      this.endereco,
      this.ramo,
      this.servicos});

  PrestadorModel.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.nome = json['nome'];
    this.telefone = json['telefone'];
    this.cnpj = json['cnpj'];
    this.endereco = json['endereco'];
    this.ramo = json['ramo'];
    this.servicos = json['servicos'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['telefone'] = this.telefone;
    data['cnpj'] = this.cnpj;
    data['endereco'] = this.endereco;
    data['ramo'] = this.ramo;
    data['servicos'] = this.servicos;
    return data;
  }
}
