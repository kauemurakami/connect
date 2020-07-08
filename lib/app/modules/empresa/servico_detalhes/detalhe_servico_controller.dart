import 'package:connect/app/data/repository/servico_repository.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class DetalheServicoController extends GetxController {

  final ServicoRepository repository;
  DetalheServicoController({@required this.repository}) : assert(repository != null);

  
}