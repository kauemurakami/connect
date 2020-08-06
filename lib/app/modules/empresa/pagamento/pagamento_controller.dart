import 'package:connect/app/data/model/cartao_model.dart';
import 'package:connect/app/data/model/user_model.dart';
import 'package:connect/app/data/repository/user_repository.dart';
import 'package:connect/app/modules/empresa/empresa_controller.dart';
import 'package:connect/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class PagamentoController extends GetxController {
  final UserRepository repository;
  PagamentoController({@required this.repository}) : assert(repository != null);

  final _metodoCartao = true.obs;
  get metodoCartao => this._metodoCartao.value;
  set metodoCartao(value) => this._metodoCartao.value = value;

  final _tipo = 1.obs;
  get tipo => this._tipo.value;
  set tipo(value) => this._tipo.value = value;

  final cartao = CartaoModel();

  onChangeSwitch(value) {
    this.metodoCartao = value;
    if (this.metodoCartao) {
      this.tipo = 1;
    } else
      this.tipo = 2;
    print(this.metodoCartao);
    print(this.tipo);
  }

  final _user = UserModel().obs;
  get user => this._user.value;
  set user(value) => this._user.value = value;

  onInit() {
    this.user = Get.find<EmpresaController>().user;
    print(this.user.nome);
    super.onInit();
  }

  addCartao() => Get.toNamed(Routes.ADD_CARTAO);

  pagar() {
    repository.pagar(this.user, tipo, this.cartao).then((data) => print(data));
  }
}
