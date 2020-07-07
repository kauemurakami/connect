import 'package:connect/app/data/provider/app_provider.dart';
import 'package:connect/app/data/repository/servico_repository.dart';
import 'package:connect/app/modules/empresa/servicos_contratados/servicos_contratado_controller.dart';
import 'package:connect/app/modules/empresa/servicos_contratados/widgets/card_servico_contratado_widget.dart';
import 'package:connect/app/theme/app_text_theme.dart';
import 'package:connect/app/widgets/custom_iconbuttonback_widget.dart';
import 'package:connect/app/widgets/custom_smallbutton_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ServicosContratadosPage extends GetView {
//repository injection
  static final ServicoRepository repository =
      ServicoRepository(apiClient: ApiClient(httpClient: http.Client()));

  final ServicosContratadosController controller = Get.put(ServicosContratadosController(repository: repository));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Row(
            children: [
              IconButtonBackWidget(),
              Text(
                'Serviços Contratados',
                style: subtitulo,
              )
            ],
          ),
          Container(
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Obx(() => CustomSmallButtonWidget(
                              text: controller.filtros[index],
                              index: index,
                              item: controller.selectedItem,
                              callback: () => controller.selectItem(index),
                            )),
                      );
                    },
                    itemCount: controller.filtros.length,
                  )
          ),
          Flexible(
                child: Container(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: 
                            CustomCardServicoContratadoWidget()
                          
                        );
                      },
                      itemCount: Get.find<ServicosContratadosController>().servicosContratados.length,
                    )),
          ),
        ]),
      ),
    );
  }
}
