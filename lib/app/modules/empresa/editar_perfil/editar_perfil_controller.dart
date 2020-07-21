import 'package:connect/app/data/model/empresa_model.dart';
import 'package:connect/app/data/repository/empresa_repository.dart';
import 'package:connect/app/modules/empresa/empresa_controller.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class EditarPerfilController extends GetxController {
  final EmpresaRepository repository;
  EditarPerfilController({@required this.repository})
      : assert(repository != null);

  final _isEmail = false.obs;
  get isEmailCheck => this._isEmail.value;
  set isEmailCheck(value) => this._isEmail.value = value;

  final _isTelefone = false.obs;
  get isTelefoneCheck => this._isTelefone.value;
  set isTelefoneCheck(value) => this._isTelefone.value = value;

  final _user = EmpresaModel().obs;
  get user => this._user.value;
  set user(value) => this._user.value = value;


  salvarAlteracoes(){
    
  }

  onSavedEmail(value) => ''; //this.user.email = value;

  //onChanged
  onChangeEmail(value) => GetUtils.isEmail(value)
      ? this.isEmailCheck = true
      : this.isEmailCheck = false;

  emailValidate(value) =>
      GetUtils.isEmail(value) ? null : 'Insira um email valido';

  onSavedName(value) => this.user.nome = value;

  nameValidate(value) => value.length < 3 ? 'Insira um nome válido' : null;

  onChangeTelefone(value) => GetUtils.isPhoneNumber(value)
      ? this.isTelefoneCheck = true
      : this.isTelefoneCheck = false;

  onSavedTelefone(value) => this.user.telefone = value;

  telefoneValidate(value) =>
      GetUtils.isPhoneNumber(value) ? null : 'Número inválido, ex 034911223344';
}
