import 'package:connect/app/data/repository/servico_repository.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class TodosServicosController extends GetxController {

  final ServicoRepository repository;
  TodosServicosController({@required this.repository}) : assert(repository != null);


}