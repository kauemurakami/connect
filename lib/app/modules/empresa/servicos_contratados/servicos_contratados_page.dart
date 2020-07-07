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

class ServicosContratadosPage extends StatelessWidget {
//repository injection
  final ServicoRepository repository =
      ServicoRepository(apiClient: ApiClient(httpClient: http.Client()));

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
          GetX<ServicosContratadosController>(
            init: ServicosContratadosController(repository: repository),
            builder: (_) {
              return Container(
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Obx(() => CustomSmallButtonWidget(
                              text: _.filtros[index],
                              index: index,
                              item: _.selectedItem,
                              callback: () => _.selectItem(index),
                            )),
                      );
                    },
                    itemCount: _.filtros.length,
                  ));
            },
          ),
          GetX<ServicosContratadosController>(
            init: ServicosContratadosController(repository: repository),
            builder: (_) {
              return Flexible(
                child: Container(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Obx(() => CustomSmallButtonWidget(
                                text: _.filtros[index],
                                index: index,
                                item: _.selectedItem,
                                callback: () => _.selectItem(index),
                              )),
                        );
                      },
                      itemCount: _.filtros.length,
                    )),
              );
            },
          ),
        ]),
      ),
    );
  }
}
