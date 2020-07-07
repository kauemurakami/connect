import 'package:connect/app/data/repository/empresa_repository.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class PagamentoController extends GetxController {

  final EmpresaRepository repository;
  PagamentoController({@required this.repository}) : assert(repository != null);

  
}