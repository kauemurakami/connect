import 'package:connect/app/data/repository/servico_repository.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class AvaliacaoServicoController extends GetxController {
  final ServicoRepository repository;
  AvaliacaoServicoController({@required this.repository})
      : assert(repository != null);

  final _servico = Get.arguments.obs;
  get servico => this._servico.value;
  set servico(value) => this._servico.value = value;

  
  final _selectedItem = 2.obs;
  get selectedItem => this._selectedItem.value;
  set selectedItem(value) => this._selectedItem.value = value;
  
  void selectItem(index) =>
      this._selectedItem != index ? selectedItem = index : null;

  final _avaliacao =
      ['muito ruim', 'ruim', 'neutro', 'satisfeito', 'muito satisfeito'].obs;
      get avaliacao => this.avaliacao.value;
      set avaliacao(value) => this._avaliacao.value = value;
  


  finalizar() => '';
}
