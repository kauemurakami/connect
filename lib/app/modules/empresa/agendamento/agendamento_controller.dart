import 'package:connect/app/data/model/servico_model.dart';
import 'package:connect/app/data/repository/empresa_repository.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class AgendarContratacaoController extends GetxController {
  final EmpresaRepository repository;
  
  AgendarContratacaoController({@required this.repository})
      : assert(repository != null);

  final _servico = Get.arguments.obs;
  get servico => this._servico.value;
  set servico(value) => this._servico.value = value;

  agendar() => '';

}
