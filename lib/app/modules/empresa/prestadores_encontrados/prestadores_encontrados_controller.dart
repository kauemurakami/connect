import 'package:connect/app/data/model/prestador_model.dart';
import 'package:connect/app/data/model/servico_model.dart';
import 'package:connect/app/data/repository/prestador_repository.dart';
import 'package:connect/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class PrestadoresEncontradosController extends GetxController {

  final PrestadorRepository repository;

  PrestadoresEncontradosController({@required this.repository}) : assert(repository != null);

  final _servicos = [ServicoModel(nome:'Limpeza geral'), ServicoModel(nome:'Limpeza de ar condicionado'), ServicoModel(nome:'Limpeza')].obs;
  get servicos => this._servicos.value;
  set servicos(value) => this._servicos.value = value;
 

  //prestadores list  
  final _prestadores = [PrestadorModel(nome: 'Kaue'), PrestadorModel(nome: 'João'), PrestadorModel(nome: 'Carlos')].obs;
  get prestadores => this._prestadores.value;
  set prestadores(value) => this._prestadores.value = value;
  
  
  detalhesServico(){
    Get.toNamed(Routes.DETALHE_SERVIC);
  }
  verTodos(){
    Get.toNamed(Routes.TODOS_SERV_PRESTAD);
  }
  
}