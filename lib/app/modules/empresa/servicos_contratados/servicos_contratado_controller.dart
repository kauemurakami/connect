import 'package:connect/app/data/model/servico_model.dart';
import 'package:connect/app/data/repository/servico_repository.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class ServicosContratadosController extends GetxController {
  final ServicoRepository repository;
  ServicosContratadosController({@required this.repository})
      : assert(repository != null);

  final _selectedItem = 0.obs;
  get selectedItem => this._selectedItem.value;
  set selectedItem(value) => this._selectedItem.value = value;

  final _filtros = ['Todos', 'Andamento', 'Canceladas', 'Completas'].obs;
  get filtros => this._filtros.value;
  set filtros(value) => this._filtros.value = value;

  final _servicosContratados = [
    ServicoModel(id: 432432, nome: 'Jardinagem', data: '29/05', status: 'Andamento'),
    ServicoModel(id: 421421, nome: 'Lavanderia', data: '13/07', status: 'Concluido'),
    ServicoModel(
        id: 423432423, nome: 'Limpeza de veiculos pesados', data: '09/09', status: 'Cancelada')
  ].obs;
  get servicosContratados => this._servicosContratados.value;
  set servicosContratados(value) => this._servicosContratados.value = value;

  void selectItem(index) =>
      this._selectedItem != index ? selectedItem = index : null;
}
