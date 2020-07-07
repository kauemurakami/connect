import 'package:connect/app/data/provider/app_provider.dart';
import 'package:connect/app/data/repository/notificacao_repository.dart';
import 'package:connect/app/modules/notificacao/notificacao_controller.dart';
import 'package:connect/app/widgets/custom_iconbuttonback_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class NotificacaoPage extends GetView {

//repository injection
static final NotificacaoRepository repository = NotificacaoRepository(apiClient: ApiClient(httpClient: http.Client()));
final NotificacaoController controller = NotificacaoController(repository: repository);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: SafeArea(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButtonBackWidget(),
            ],
          ),
          Text(controller.notificacao.notificacao),
        ],
      )
      ),
    );
  }
}