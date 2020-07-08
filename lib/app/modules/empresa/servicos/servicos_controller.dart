import 'package:connect/app/data/model/servico_model.dart';
import 'package:connect/app/data/repository/servico_repository.dart';
import 'package:connect/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class ServicosController extends GetxController {

  final ServicoRepository repository;
  ServicosController({@required this.repository}) : assert(repository != null);


  final _servicos = [ServicoModel(nome:'Limpeza geral', data: '22 de maio'), ServicoModel(nome:'Limpeza de ar condicionado', data: '02 de junho'), ServicoModel(nome:'Limpeza', data: '13 de agosto')].obs;
  get servicos => this._servicos.value;
  set servicos(value) => this._servicos.value = value;

  addServico() => Get.toNamed(Routes.ADD_SERVICO);
  
  servicoDetalhes(servico) => Get.toNamed(Routes.DETALHE_SERVIC, arguments: servico);
}