import 'package:connect/app/data/model/categoria_model.dart';
import 'package:connect/app/data/model/categorias_model.dart';
import 'package:connect/app/data/provider/app_provider.dart';
import 'package:connect/app/data/repository/categoria_repository.dart';
import 'package:connect/app/data/repository/empresa_repository.dart';
import 'package:connect/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

class PesquisarController extends GetxController {
  final EmpresaRepository repository;
  PesquisarController({@required this.repository}) : assert(repository != null);

  final CategoriaRepository catRepository = CategoriaRepository(apiClient: ApiClient(httpClient: http.Client()));
  
  final _selectedItem = 0.obs;
  get selectedItem => this._selectedItem.value;
  set selectedItem(value) => this._selectedItem.value = value;

  final _selectedCategoria = 0.obs;
  get selectedCategoria => this._selectedCategoria.value;
  set selectedCategoria(value) => this._selectedCategoria.value = value;

  final _filtros = ['Avaliação', 'Cidade', 'Estado', 'Certificados'].obs;
  get filtros => this._filtros.value;
  set filtros(value) => this._filtros.value = value;

  final _distancia = 1.0.obs;
  get distancia => this._distancia.value;
  set distancia(value) => this._distancia.value = value;

  CategoriasModel _categorias = CategoriasModel();
  get categorias => this._categorias;
  set categorias(value) => this._categorias = value;

  changeDistancia(value) => this.distancia = value;

  void selectItem(index) =>
      this._selectedItem != index ? selectedItem = index : null;
  void selectCategoria(index) =>
      this._selectedCategoria != index ? selectedCategoria = index : null;
      
  var a ;
  getCategorias(){
    catRepository.getAll().then((data) {
      this.categorias = data;
     });
  }
  onInit(){
    getCategorias();
    super.onInit();
  }

  //add filtros etc
  pesquisar() {
    Get.toNamed(Routes.PESQ_PRESTAD);
  }
  notificacoes(){
    Get.toNamed(Routes.NOTIFICACOES);
  }
}
