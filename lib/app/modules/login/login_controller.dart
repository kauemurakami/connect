import 'package:connect/app/data/model/user_model.dart';
import 'package:connect/app/data/provider/app_provider.dart';
import 'package:connect/app/data/repository/servico_repository.dart';
import 'package:connect/app/data/repository/user_repository.dart';
import 'package:connect/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http ;

class LoginController extends GetxController {
  final UserRepository repository;
  LoginController({@required this.repository}) : assert(repository != null);

  final _isEmail = false.obs;
  get isEmailCheck => this._isEmail.value;
  set isEmailCheck(value) => this._isEmail.value = value;

  final _user = UserModel().obs;
  get user => this._user.value;
  set user(value) => this._user.value = value;

  final _obscure = true.obs;
  get obscure => this._obscure.value;
  set obscure(value) => this._obscure.value = value;

  //verificar se é usuário comum ou admin
  login() {
    repository.login(this.user).then((data){
      this.user = data;
     Get.offAllNamed(Routes.HOME_EMPRESA, arguments: this.user);
    }); 
  }

  @override
  void onInit() {
    //print(ServicoRepository(apiClient: ApiClient(httpClient: http.Client())));
    super.onInit();
  }

  //onChanged
  onChangeEmail(value) {
    if (GetUtils.isEmail(value)) {
      this.isEmailCheck = true;
    } else
      this.isEmailCheck = false;
  }

  onSavedPassword(value) {
    this.user.senha = value;
  }
  onSavedEmail(value) {
    this.user.email = value;
  }
  emailValidate(value) {
    if (GetUtils.isEmail(value)) {
      return null;
    } else
      return 'Insira um email válido';
  }

  passwordValidate(value) => value.length < 5 ? 'Insira uma senha válida' : null ;

  showPassword() {
    if (this.obscure) {
      this.obscure = false;
    } else
      this.obscure = true;
  }
}
