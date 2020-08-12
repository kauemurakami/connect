import 'package:connect/app/data/model/categoria_servico_model.dart';
import 'package:connect/app/data/model/servico_model.dart';
import 'package:connect/app/data/model/servicos_categoria.dart';
import 'package:connect/app/data/repository/servico_repository.dart';
import 'package:connect/app/modules/empresa/empresa_controller.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class AddServicoController extends GetxController {
  final ServicoRepository repository;
  AddServicoController({@required this.repository})
      : assert(repository != null);

  final _servicos = CategoriasServicoModel().obs;
  get servicos => this._servicos.value;
  set servicos(value) => this._servicos.value = value;

  final _servico = ServicoModel().obs;
  get servico => this._servico.value;
  set servico(value) => this._servico.value = value;

  onSavedCategoriaServico(value) => this.servico.nome = value;
  validateCategoriaServico(value) =>
      value.length < 2 ? 'Insira uma categoria válida' : null;
  onChangedCategoriaServico(value) => this.servico.nome;
  @override
  void onInit() {
    repository
        .categoriasServico(Get.find<EmpresaController>().user.id)
        .then((data) => this.servicos = data);
    super.onInit();
  }

  final _selectedCategoriaServico = CategoriaServicos().obs;
  get selectedCategoriaServico => this._selectedCategoriaServico.value;
  set selectedCategoriaServico(value) => this._selectedCategoriaServico.value = value;

  onChangeDropdownItem(value) {
    this.selectedCategoriaServico = value;
    getServicosViaCategoria();
  }

  
  final _selectedServico = Servicos().obs;
  get selectedServico => this._selectedServico.value;
  set selectedServico(value) => this._selectedServico.value = value;
  
  onChangeDropdownItemServico(value) {
    this.selectedServico = value;
  }
  

  
  final _servicosAdicionados = List<Servicos>().obs;
  get servicosAdicionados => this._servicosAdicionados.value;
  set servicosAdicionados(value) => this._servicosAdicionados.value = value;
  
  addServico(){
    this.servicosAdicionados.add(selectedServico);
  }

  final _servicosCategoria = ServicosCategoria().obs;
  get servicosCategoria => this._servicosCategoria.value;
  set servicosCategoria(value) => this._servicosCategoria.value = value;

  getServicosViaCategoria() {
    repository
        .getServicos(
            Get.find<EmpresaController>().user.id, this.selectedCategoriaServico.id)
        .then((data) => this.servicosCategoria = data);
  }
}
