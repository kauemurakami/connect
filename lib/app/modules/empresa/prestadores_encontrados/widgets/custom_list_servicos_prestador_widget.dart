import 'package:connect/app/data/provider/app_provider.dart';
import 'package:connect/app/data/repository/prestador_repository.dart';
import 'package:connect/app/modules/empresa/prestadores_encontrados/prestadores_encontrados_controller.dart';
import 'package:connect/app/widgets/custom_smallbutton_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CustomListservicosWidget extends StatelessWidget {
  final PrestadorRepository repository =
      PrestadorRepository(apiClient: ApiClient(httpClient: http.Client()));
  final PrestadoresEncontradosController controller = Get.find<PrestadoresEncontradosController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(() => Container(
            height: 240,
            width: MediaQuery.of(context).size.width / 1.13,
            padding: EdgeInsets.only(left: 8.0),
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, idx) {
                  return Container(
                    width: 180,
                    child: Flex(
                      direction: Axis.vertical,
                      children: <Widget>[
                        Flexible(
                          child: Card(
                            elevation: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Center(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: EdgeInsets.only(top: 8.0),
                                    child: Image.network(
                                      'https://source.unsplash.com/random/150x150',
                                    ),
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Container(
                                      height: 74,
                                      width: MediaQuery.of(context).size.width,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                           Container(
                                             padding: EdgeInsets.only(top:10),
                                             child: Text(
                                              controller.servicos[idx].nome,
                                              softWrap: true,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                          ),
                                           ),
                                          CustomSmallButtonWidget(
                                              callback: controller.detalhesServico,
                                              text: 'Ver +'),
                                        ],
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: controller.servicos.length),
          )),
    );
  }
}