import 'package:connect/app/data/provider/app_provider.dart';
import 'package:meta/meta.dart';

class UserRepository {

final ApiClient apiClient;

UserRepository({@required this.apiClient}) : assert(apiClient != null);

  cadastro(user) => apiClient.cadastro(user);

  login(user) => apiClient.login(user);

}