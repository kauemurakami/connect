import 'package:connect/app/data/repository/servico_repository.dart';
import 'package:connect/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class ServicoContratadoPrestadoController extends GetxController {

  final ServicoRepository repository;
  ServicoContratadoPrestadoController({@required this.repository}) : assert(repository != null);
  
  final _servico = Get.arguments.obs;
  get servico => this._servico.value;
  set servico(value) => this._servico.value = value;
  
  Color statusColor(){
    if(this.servico.status == 'Andamento'){
      return Colors.blue;
    }else if(this.servico.status == 'Concluido'){
      return Colors.green;
    }else return Colors.red;
  } 

  avaliarServico() => Get.toNamed(Routes.AVALIACAO_SERV, arguments: this.servico);

}