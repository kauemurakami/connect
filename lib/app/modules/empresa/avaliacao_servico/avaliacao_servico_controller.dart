import 'package:connect/app/data/repository/servico_repository.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class AvaliacaoServicoController extends GetxController {

  final ServicoRepository repository;
  AvaliacaoServicoController({@required this.repository}) : assert(repository != null);

  
  final _servico = Get.arguments.obs;
  get servico => this._servico.value;
  set servico(value) => this._servico.value = value;

 finalizar() =>'' ;

}