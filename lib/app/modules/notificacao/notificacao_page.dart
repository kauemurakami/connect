import 'package:connect/app/data/provider/app_provider.dart';
import 'package:connect/app/data/repository/notificacao_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class NotificacaoPage extends StatelessWidget {

//repository injection
final NotificacaoRepository repository = NotificacaoRepository(apiClient: ApiClient(httpClient: http.Client()));

  @override
  Widget build(BuildContext context) {

    return Scaffold(

    body: Container(
      child: Text('notificacoes')
      ),
    );
  }
}