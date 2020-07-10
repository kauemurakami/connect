import 'package:connect/app/data/repository/empresa_repository.dart';
import 'package:connect/app/modules/empresa/home/empresa_home_controller.dart';
import 'package:connect/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class PerfilController extends GetxController {
  final EmpresaRepository repository;
  PerfilController({@required this.repository}) : assert(repository != null);
  //telefone da empresa

  editarPerfil() => Get.toNamed(Routes.EDIT_PERFIL_EMPRESA);

  servicosContratados() => Get.toNamed(Routes.SERVICOS_CONTRAT);

  relatorios() => Get.find<EmpresaHomeController>().screen = 2;

  pagamento() => Get.toNamed(Routes.PAGAMENTO);

  alterarSenha() => Get.toNamed(Routes.ALTERAR_SENHA);
}
