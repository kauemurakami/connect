import 'package:connect/app/data/provider/app_provider.dart';
import 'package:meta/meta.dart';

class CategoriaRepository {

final ApiClient apiClient;

CategoriaRepository({@required this.apiClient}) : assert(apiClient != null);


  getAll(){
    return apiClient.getCategorias();
  }

  getCategoria(){

  }

  getSubCategoria(){

  }

}