import 'package:connect/app/data/provider/app_provider.dart';
import 'package:connect/app/data/repository/servico_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class TodosServicosPage extends StatelessWidget {

//repository injection
final ServicoRepository repository = ServicoRepository(apiClient: ApiClient(httpClient: http.Client()));

  @override
  Widget build(BuildContext context) {

    return Scaffold(

    body: Container(
      child: Text('todos servicos')
      ),
    );
  }
}