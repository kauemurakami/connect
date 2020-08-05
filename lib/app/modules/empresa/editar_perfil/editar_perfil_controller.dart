import 'package:connect/app/data/model/user_model.dart';
import 'package:connect/app/data/repository/user_repository.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class EditarPerfilController extends GetxController {
  final UserRepository repository;
  EditarPerfilController({@required this.repository})
      : assert(repository != null);

  final _isEmail = false.obs;
  get isEmailCheck => this._isEmail.value;
  set isEmailCheck(value) => this._isEmail.value = value;

  final _isTelefone = false.obs;
  get isTelefoneCheck => this._isTelefone.value;
  set isTelefoneCheck(value) => this._isTelefone.value = value;

  final _user = UserModel().obs;
  get user => this._user.value;
  set user(value) => this._user.value = value;

  onChangedName(value) => this.user.nome = value;

  onChangedCPForCNPJ(value) => this.user.cnpjOrCpf = value;

  onChangedEstado(value) => this.user.estado = value;

  onChangedCidade(value) => this.user.cidade = value;

  onChangedEndereco(value) => this.user.endereco = value;

  onSavedCidade(value) => this.user.cidade = value;

  onSavedEstado(value) => this.user.estado = value;

  onSavedCPForCNPJ(value) => this.user.cnpjOrCpf = value;

  onSavedEndereco(value) => this.user.endereco = value;

  salvarAlteracoes() => repository.editarPerfil(this.user).then((data) => this.sucesso = data );

  onSavedName(value) => this.user.nome = value;
  validateCPForCNPJ(value) =>
      value.length < 11 ? 'Insira um cpf ou cnpj válido' : null;
  validateEndereco(value) => value.length < 4 ? 'Insira um endereço válido' : null;
  validateCidade(value) => value.length < 3 ? 'Insira uma cidade válida' : null;
  validateEstado(value) => value.length < 4 ? 'Insira um estado válido' : null;
  validateTelefone(value) => value.length < 11 ? 'Insira um telefone válido' : null;
  nameValidate(value) => value.length < 2 ? 'Insira um nome válido' : null;
  
  final _sucesso = false.obs;
  get sucesso => this._sucesso.value;
  set sucesso(value) => this._sucesso.value = value;
  
  onChangedTelefone(value) => GetUtils.isPhoneNumber(value)
      ? this.isTelefoneCheck = true
      : this.isTelefoneCheck = false;

  onSavedTelefone(value) => this.user.telefone = value;

  telefoneValidate(value) =>
      GetUtils.isPhoneNumber(value) ? null : 'Número inválido, ex 034911223344';
}
