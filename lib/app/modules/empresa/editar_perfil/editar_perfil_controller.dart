import 'package:connect/app/data/repository/empresa_repository.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class EditarPerfilController extends GetxController {

  final EmpresaRepository repository;
  EditarPerfilController({@required this.repository}) : assert(repository != null);

  
}