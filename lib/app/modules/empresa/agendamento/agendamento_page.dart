import 'package:connect/app/data/provider/app_provider.dart';
import 'package:connect/app/data/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AgendarContratacaoPage extends StatelessWidget {

//repository injection
final UserRepository repository = UserRepository(apiClient: ApiClient(httpClient: http.Client()));

  @override
  Widget build(BuildContext context) {

    return Scaffold(
    appBar: AppBar(title: Text('AgendarContratacaoPage')),

    body: Container(
      child: Text('Agendar contratacao')
      ),
    );
  }
}