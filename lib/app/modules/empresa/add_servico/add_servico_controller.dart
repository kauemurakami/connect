import 'package:connect/app/data/model/servico_model.dart';
import 'package:connect/app/data/repository/servico_repository.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class AddServicoController extends GetxController {

  final ServicoRepository repository;
  AddServicoController({@required this.repository}) : assert(repository != null);

  final _servicos = [ServicoModel(nome:'Limpeza geral', data: '22 de maio'), ServicoModel(nome:'Limpeza de ar condicionado', data: '02 de junho'), ServicoModel(nome:'Limpeza', data: '13 de agosto')].obs;
  get servicos => this._servicos.value;
  set servicos(value) => this._servicos.value = value;
  
  final _selectedServico = ServicoModel().obs;
  get selectedServico => this._selectedServico.value;
  set selectedServico(value) => this._selectedServico.value = value;
  
  onChangeDropdownItem(value) => this.selectedServico = value;
}