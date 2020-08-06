import 'package:connect/app/data/model/cartao_model.dart';
import 'package:connect/app/data/repository/user_repository.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class PagamentoController extends GetxController {
  final UserRepository repository;
  PagamentoController({@required this.repository}) : assert(repository != null);

  final _metodoCartao = true.obs;
  get metodoCartao => this._metodoCartao.value;
  set metodoCartao(value) => this._metodoCartao.value = value;

  final cartao = CartaoModel().obs;

  onChangeSwitch(value) {
    this.metodoCartao = value;
    print(this.metodoCartao);
  }

  pagar(){
    
  }
}
