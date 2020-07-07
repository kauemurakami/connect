import 'package:connect/app/data/repository/empresa_repository.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class RelatorioController extends GetxController {

  final EmpresaRepository repository;
  RelatorioController({@required this.repository}) : assert(repository != null);


}