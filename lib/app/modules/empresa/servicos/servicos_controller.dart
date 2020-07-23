import 'package:connect/app/data/model/categoria_model.dart';
import 'package:connect/app/data/model/prestador_model.dart';
import 'package:connect/app/data/model/servico_model.dart';
import 'package:connect/app/data/repository/servico_repository.dart';
import 'package:connect/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class ServicosController extends GetxController {
  final ServicoRepository repository;
  ServicosController({@required this.repository}) : assert(repository != null);

  final _servicos = [
    ServicoModel(
        id: 64363,
        nome: 'Limpeza de tubulações',
        categoria: CategoriaModel(categoria: 'Limpeza'),
        data: '13 de agosto',
        descricao:
            'Trabalhamos na área a mais 10 anos, sempre prestando o melhor serviço para melhor lhe atender',
        prestador: PrestadorModel(
            nome: 'Kauê Murakami',
            cnpj: '31234221',
            endereco: 'Rua Numero 0',
            telefone: '0349123456')),
    ServicoModel(
        id: 263262,
        nome: 'Limpeza galerias',
        categoria: CategoriaModel(categoria: 'Limpeza'),
        data: '24 de junho',
        descricao:
            'Trabalhamos na área a mais 10 anos, sempre prestando o melhor serviço para melhor lhe atender',
        prestador: PrestadorModel(
            nome: 'Kauê Murakami',
            cnpj: '31234221',
            endereco: 'Rua Numero 0',
            telefone: '0349123456')),
    ServicoModel(
        id: 513253,
        nome: 'Mecânica pesada',
        categoria: CategoriaModel(categoria: 'Automóveis'),
        data: '25 de julho',
        descricao:
            'Trabalhamos na área a mais 10 anos, sempre prestando o melhor serviço para melhor lhe atender',
        prestador: PrestadorModel(
            nome: 'Kauê Murakami',
            cnpj: '31234221',
            endereco: 'Rua Numero 0',
            telefone: '0349123456')),
    ServicoModel(
        id: 53253,
        nome: 'Mecânica de carros',
        categoria: CategoriaModel(categoria: 'Automóveis'),
        data: '12 de outubro',
        descricao:
            'Trabalhamos na área a mais 10 anos, sempre prestando o melhor serviço para melhor lhe atender',
        prestador: PrestadorModel(
            nome: 'Kauê Murakami',
            cnpj: '31234221',
            endereco: 'Rua Numero 0',
            telefone: '0349123456')),
    ServicoModel(
        id: 21412,
        nome: 'Pinturas',
        categoria: CategoriaModel(categoria: 'Construção cívil'),
        data: '01 de setembro',
        descricao:
            'Trabalhamos na área a mais 10 anos, sempre prestando o melhor serviço para melhor lhe atender',
        prestador: PrestadorModel(
            nome: 'Kauê Murakami',
            cnpj: '31234221',
            endereco: 'Rua Numero 0',
            telefone: '0349123456')),
    ServicoModel(
      id: 321312,
      nome: 'Reformas em piscinas',
      categoria: CategoriaModel(categoria: 'Construção cívil'),
      data: '03 de novembro',
      descricao:
          'Trabalhamos na área a mais 10 anos, sempre prestando o melhor serviço para melhor lhe atender',
      prestador: PrestadorModel(
          nome: 'Kauê Murakami',
          cnpj: '31234221',
          endereco: 'Rua Numero 0',
          telefone: '0349123456'),
    ),
  ].obs;
  get servicos => this._servicos;
  set servicos(value) => this._servicos.value = value;

  addServico() => Get.toNamed(Routes.ADD_SERVICO);

  servicoDetalhes(servico) =>
      Get.toNamed(Routes.DETALHE_SERVIC, arguments: servico);
}
