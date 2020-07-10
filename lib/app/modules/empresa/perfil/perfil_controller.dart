import 'package:connect/app/data/repository/empresa_repository.dart';
import 'package:connect/app/modules/empresa/home/empresa_home_controller.dart';
import 'package:connect/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:url_launcher/url_launcher.dart';

class PerfilController extends GetxController {
  final EmpresaRepository repository;
  PerfilController({@required this.repository}) : assert(repository != null);
  //telefone da empresa
  ligar() async {
    const url = "tel:(16)999999999";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Aplicativo não encontrado';
    }
  }

  editarPerfil() => Get.toNamed(Routes.EDIT_PERFIL_EMPRESA);

  servicosContratados() => Get.toNamed(Routes.SERVICOS_CONTRAT);

  relatorios() => Get.find<EmpresaHomeController>().screen = 2;

  pagamento() => Get.toNamed(Routes.PAGAMENTO);

  alterarSenha() => '';
}
