import 'package:connect/app/data/provider/app_provider.dart';
import 'package:connect/app/data/repository/prestador_repository.dart';
import 'package:connect/app/modules/empresa/prestadores_encontrados/prestadores_encontrados_controller.dart';
import 'package:connect/app/modules/empresa/prestadores_encontrados/widgets/custom_list_servicos_prestador_widget.dart';
import 'package:connect/app/theme/app_text_theme.dart';
import 'package:connect/app/widgets/custom_iconbuttonback_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PrestadoresEncontradosPage extends GetView {
//repository injection
  static final PrestadorRepository prestadorRepository =
      PrestadorRepository(apiClient: ApiClient(httpClient: http.Client()));
  final PrestadoresEncontradosController controller = Get.put(PrestadoresEncontradosController(repository: prestadorRepository));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                IconButtonBackWidget(),
                Column(
                  children: <Widget>[
                    Container(
                        height: MediaQuery.of(context).size.height / 1.13,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Card(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Image.network(
                                        'https://source.unsplash.com/random/800x600',
                                        width: 320,
                                        height: 250,
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    width: 1,
                                                    color: Colors.lightGreen)),
                                            child: Padding(
                                                padding: EdgeInsets.all(4),
                                                child: Text(
                                                  'Categoria',
                                                  style: destaqueText,
                                                )),
                                          ),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 16),
                                              child: Text(
                                                'Cidade',
                                                style: destaqueText,
                                              )),
                                        ],
                                      ),
                                    ),
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                50,
                                        padding: EdgeInsets.only(
                                            left: 16, right: 16),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              controller
                                                  .prestadores[index].nome,
                                              style: subtitulo,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0),
                                              child: Text(
                                                'Descrição',
                                                style: subtitulo,
                                              ),
                                            ),
                                            Container(
                                                height: 80,
                                                child: Text(
                                                  'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer to',
                                                  style: descricao,
                                                ))
                                          ],
                                        )),
                                    Container(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Padding(
                                                padding: EdgeInsets.all(4),
                                                child: Text(
                                                  'Serviços Prestados',
                                                  style: subtitulo,
                                                )),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 16),
                                                child: GestureDetector(
                                                  onTap: controller.verTodos,
                                                  child: Text(
                                                    'VER TODOS',
                                                    style: destaqueText,
                                                  ),
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                    CustomListservicosWidget()
                                  ],
                                ),
                              ),
                            );
                          },
                          itemCount: controller.prestadores.length,
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
    );
  }
}