import 'package:connect/app/data/model/prestador_model.dart';
import 'package:connect/app/data/model/servico_model.dart';
import 'package:connect/app/data/repository/prestador_repository.dart';
import 'package:connect/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class PrestadoresEncontradosController extends GetxController {

  final PrestadorRepository repository;
  PrestadoresEncontradosController({@required this.repository}) : assert(repository != null);

  final servicos = [ServicoModel(nome:'Limpeza geral', id: 1, descricao: 'A mais de 10 anos na area prestando sempre o melhor servico pra você'), ServicoModel(nome:'Limpeza de ar condicionado', id: 3, descricao: 'A mais de 10 anos na area prestando sempre o melhor servico pra você'), ServicoModel(nome:'Limpeza', id: 2, descricao: 'A mais de 10 anos na area prestando sempre o melhor servico pra você')].obs;
 
  //prestadores list  
  final prestadores = [PrestadorModel(nome: 'Kaue'), PrestadorModel(nome: 'João'), PrestadorModel(nome: 'Carlos')].obs;

  
  final servico = ServicoModel().obs;

  detalhesServico(servico){
    Get.toNamed(Routes.DETALHE_SERVIC, arguments: servico);
  }
  verTodos(){
    Get.toNamed(Routes.TODOS_SERV_PRESTAD);
  }
  
}