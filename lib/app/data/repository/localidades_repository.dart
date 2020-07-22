import 'package:connect/app/data/provider/localidades_provider.dart';
import 'package:meta/meta.dart';

class LocalidadesRepository {
  final LocalidadesApiClient apiClient;

  LocalidadesRepository({@required this.apiClient}) : assert(apiClient != null);


  getEstados(){
    return apiClient.getEstados();
  }

  getCidades(estado){
    return apiClient.getCidades(estado);
  }

}
