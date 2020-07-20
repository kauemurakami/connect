import 'package:connect/app/data/model/user_model.dart';
import 'package:connect/app/data/repository/user_repository.dart';
import 'package:connect/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class CadastroController extends GetxController {
  final UserRepository repository;
  CadastroController({@required this.repository}) : assert(repository != null);

  final _user = UserModel().obs;
  get user => this._user.value;
  set user(value) => this._user.value = value;

  final _isEmailCheck = false.obs;
  get isEmailCheck => this._isEmailCheck.value;
  set isEmailCheck(value) => this._isEmailCheck.value = value;

  final _obscure = true.obs;
  get obscure => this._obscure.value;
  set obscure(value) => this._obscure.value = value;

  final _pass = ''.obs;
  get pass => this._pass.value;
  set pass(value) => this._pass.value = value;

  
  final _isEmpresa = false.obs;
  get isEmpresa => this._isEmpresa.value;
  set isEmpresa(value) => this._isEmpresa.value = value;
  
  onSavedPassword(value) => this.user.senha = value;
  
  onSavedEmail(value) => this.user.email = value;

  onSavedName(value) => this.user.nome = value;

  onSavedEstado(value) => this.user.estado = value;

  onSavedCidade(value) => this.user.cidade = value;

  onSavedEndereco(value) => this.user.endereco = value;

  onSavedTelefone(value) => this.user.telefone = value;

  onSavedCpfCnpj(value) => this.user.cnpjOrCpf = value ;

  emailValidate(value) => GetUtils.isEmail(value) ? null : 'Insira um email válido';
  
  onChangeEmail(value) => GetUtils.isEmail(value) ? this.isEmailCheck = true : this.isEmailCheck = false;
  
  telefoneValidate(value) => value.length < 11 ? 'Insíra um número válido' : null;

  showPassword() => this.obscure ? this.obscure = false : this.obscure = true;
  
  passwordValidate(value) {
    if (value.length > 5) {
      if (this.pass == '') {
        this.pass = value;
      } else if (value == this.pass) {
        return null;
      } else
        return 'As senhas devem ser identicas';
    } else
      return 'Insira uma senha válida';
  }
  onChangeSwitch(value) => value == this.isEmpresa? null : this.isEmpresa = value ;

  c(){
    print('oi');
  }

  cadastrar(){
    this.isEmpresa ? this.user.tipo = '1' : this.user.tipo = '2';
    repository.cadastro(this.user); 
    print(this.user.nome);
    print(this.user.email);
    print(this.user.tipo);
    print(this.user.telefone);
    print(this.user.cnpjOrCpf);
    print(this.user.endereco);
    print(this.user.estado);
    print(this.user.cidade);

  } 

}