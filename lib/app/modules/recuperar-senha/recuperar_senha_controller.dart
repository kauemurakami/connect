import 'package:connect/app/data/repository/user_repository.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class RecuperarSenhaController extends GetxController {
  final UserRepository repository;
  RecuperarSenhaController({@required this.repository})
      : assert(repository != null);

  final _isEmail = false.obs;
  get isEmailCheck => this._isEmail.value;
  set isEmailCheck(value) => this._isEmail.value = value;

  final _email = ''.obs;
  get email => this._email.value;
  set email(value) => this._email.value = value;
  
  final _sucesso = ''.obs;
  get sucesso => this._sucesso.value;
  set sucesso(value) => this._sucesso.value = value;

  onChangeEmail(value) {
    print('onchange');
    if (GetUtils.isEmail(value)) {
      this.isEmailCheck = true;
    } else
      this.isEmailCheck = false;
  }

  recuperarSenha(){
    repository.recuperarSenha(this.email).then((data) => this.sucesso = data );
  }
  
//onSaved
  onSavedEmail(value) {
    this.email = value;
  }

  emailValidate(value) {
    if (GetUtils.isEmail(value)) {
      return null;
    } else
      return 'Insira um email válido';
  }
}
