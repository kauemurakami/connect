import 'package:connect/app/data/provider/app_provider.dart';
import 'package:connect/app/data/repository/servico_repository.dart';
import 'package:connect/app/modules/empresa/servicos/servicos_controller.dart';
import 'package:connect/app/modules/empresa/servicos/widgets/custom_cardservico_widget.dart';
import 'package:connect/app/theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ServicoScreen extends StatelessWidget {
//repository injection
  static final ServicoRepository repository =
      ServicoRepository(apiClient: ApiClient(httpClient: http.Client()));
  final ServicosController controller =
      Get.put(ServicosController(repository: repository));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 16.0),
                child: Text(
                  'Serviços Cadastrados',
                  style: subtitulo,
                ),
              )
            ],
          ),
          Obx(
            () => Flexible(
              child: Container(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: controller.servicos.length,
                  itemBuilder: (context, index) {
                    return CustomCardServicoWidget(
                      servico: controller.servicos[index],
                    );
                  },
                ),
              ),
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.addServico(),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
