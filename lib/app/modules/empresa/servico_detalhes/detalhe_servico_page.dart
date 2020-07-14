import 'package:connect/app/data/provider/app_provider.dart';
import 'package:connect/app/data/repository/servico_repository.dart';
import 'package:connect/app/modules/empresa/servico_detalhes/detalhe_servico_controller.dart';
import 'package:connect/app/modules/empresa/servico_detalhes/widgets/custom_card_servico_detalhe_widget.dart';
import 'package:connect/app/theme/app_text_theme.dart';
import 'package:connect/app/widgets/custom_iconbuttonback_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DetalhesServicoPage extends GetView {
  static final ServicoRepository repository =
      ServicoRepository(apiClient: ApiClient(httpClient: http.Client()));

  final DetalheServicoController controller =
      Get.put(DetalheServicoController(repository: repository));

  @override
  Widget build(BuildContext context) {
    print(controller.servico);
    return Scaffold(
      body: SingleChildScrollView(
              child: Container(
            height: Get.height,
            width: Get.width,
            child: SafeArea(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                  Row(
                    children: [
                      IconButtonBackWidget(),
                      Text(
                        'Serviço',
                        style: subtitulo,
                      )
                    ],
                  ),
                  Container(
                      width: Get.width,
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(controller.servico.id.toString(),
                              style: TextStyle(fontSize: 24, color: Colors.grey)),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 24.0, bottom: 24.0),
                            child: Text(
                              controller.servico.nome,
                              style: titulo,
                            ),
                          ),
                          Text(
                            controller.servico.descricao,
                            style: TextStyle(fontSize: 20, color: Colors.grey),
                          ),
                          //Text(controller.servico.categoria.nome)
                          //Text(controller.servico.prestador.nome)
                          //Text(controller.servico.prestador.cpnj)
                        ],
                      )),
                  Container(
                    width: Get.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RaisedButton.icon(
                            onPressed: () => controller.contratacao,
                            icon: Icon(
                              Icons.whatshot,
                              color: Colors.white,
                            ),
                            label: Text(
                              'Oferecer serviço',
                              style: TextStyle(color: Colors.white),
                            )),
                        RaisedButton.icon(
                            color: Colors.lightGreen,
                            onPressed: () => controller.agendamento(),
                            icon: Icon(
                              Icons.calendar_today,
                              color: Colors.white,
                            ),
                            label: Text(
                              'Agendar Contratação',
                              style: TextStyle(color: Colors.white),
                            )),
                      ],
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(top: 16, bottom: 16),
                      width: Get.width,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Text(
                                'Imagens',
                                style: subtitulo,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 16),
                              height: Get.height / 2.8,
                              width: Get.width,
                              child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    CustomCardServicoDetalheWidget(),
                                    CustomCardServicoDetalheWidget(),
                                    CustomCardServicoDetalheWidget(),
                                    CustomCardServicoDetalheWidget(),
                                  ]),
                            ),
                          ])),
                 
                ]))),
      ),
    );
  }
}
