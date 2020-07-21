import 'package:connect/app/data/repository/empresa_repository.dart';
import 'package:connect/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class EmpresaController extends GetxController {
  final EmpresaRepository repository;
  EmpresaController({@required this.repository}) : assert(repository != null);

  //obj empresa

  notificacoes() => Get.toNamed(Routes.NOTIFICACOES);

  chat() {
    //Get.toNamed(Routes.MESSAGES);
  }

  final _user = Get.arguments.obs;
  get user => this._user.value;
  set user(value) => this._user.value = value;
  
}
