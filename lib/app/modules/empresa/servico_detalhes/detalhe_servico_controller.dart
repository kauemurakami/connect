import 'package:connect/app/data/model/servico_model.dart';
import 'package:connect/app/data/repository/servico_repository.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class DetalheServicoController extends GetxController {

  final ServicoRepository repository;
  DetalheServicoController({@required this.repository}) : assert(repository != null);
 
  final _servico = Get.arguments.obs;
  get servico => this._servico.value;
  set servico(value) => this._servico.value = value;
  
  agendamento() => '';
  
  contratacao() => '';
}