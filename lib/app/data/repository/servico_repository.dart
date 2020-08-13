import 'package:connect/app/data/provider/app_provider.dart';
import 'package:meta/meta.dart';

class ServicoRepository {

final ApiClient apiClient;

ServicoRepository({@required this.apiClient}) : assert(apiClient != null);

  unidadeServicos(){
    return apiClient.unidadesServico();
  }

  categoriasServico(idEmpresa){
    return apiClient.categoriaServico(idEmpresa);
  }
  
  getServicos(idEmpresa, idCategoriaServico) => apiClient.getServicos(idCategoriaServico, idEmpresa);

  addDemandaServico(demanda, servicos) => apiClient.addDemandaServico(demanda, servicos);

  getPrestadorServicos(prestador){

  }

  getServico(id){

  }

  addservico(){

  }

  removeServico(){

  }
  editServico(){
    
  }

}