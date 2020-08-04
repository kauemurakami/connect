import 'package:connect/app/data/model/cadastros_model.dart';
import 'package:connect/app/data/model/user_model.dart';
import 'package:connect/app/data/repository/empresa_repository.dart';
import 'package:connect/app/data/repository/user_repository.dart';
import 'package:connect/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class EmpresaController extends GetxController {
  final UserRepository repository;
  EmpresaController({@required this.repository}) : assert(repository != null);

  notificacoes() => Get.toNamed(Routes.NOTIFICACOES);

  chat() {
    //Get.toNamed(Routes.MESSAGES);
  }

  open() {}

  final _user = Get.arguments.obs;
  get user => this._user.value;
  set user(value) => this._user.value = value;

  final _pagina = 1.obs;
  get pagina => this._pagina.value;
  set pagina(value) => this._pagina.value = value;

  onInit() {
    getHome();
    super.onInit();
  }

  final _cadastros = Cadastro().obs;
  get cadastros => this._cadastros.value;
  set cadastros(value) => this._cadastros.value = value;

  getHome() {
    repository.getUsuariosHome(this.user, this.pagina).then((data) {
      this.cadastros = data;
      print(cadastros.cadastros[0].nome);
      print(cadastros.cadastros.length.toString());
    });
  }
}
