import 'package:connect/app/data/provider/app_provider.dart';
import 'package:connect/app/data/repository/notificacao_repository.dart';
import 'package:connect/app/modules/notificacoes/notificacoes_controller.dart';
import 'package:connect/app/modules/notificacoes/widgets/custom_cardnotification_widget.dart';
import 'package:connect/app/theme/app_text_theme.dart';
import 'package:connect/app/widgets/custom_iconbuttonback_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class NotificacoesPage extends StatelessWidget {
//repository injection
  static final NotificacaoRepository repository =
      NotificacaoRepository(apiClient: ApiClient(httpClient: http.Client()));

  final NotificacoesController controller =
      Get.put(NotificacoesController(repository: repository));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              IconButtonBackWidget(),
              Text(
                'Notificações',
                style: subtitulo,
              )
            ],
          ),
          Obx(
            () => Flexible(
              child: Container(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: controller.notificacoes.length,
                  itemBuilder: (context, index) {
                    return CustomCardNotificacao(
                        controller.notificacoes[index].notificacao,
                        controller.notificacoes[index].data);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
