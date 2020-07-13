import 'package:connect/app/data/provider/app_provider.dart';
import 'package:connect/app/data/repository/servico_repository.dart';
import 'package:connect/app/modules/empresa/avaliacao_servico/avaliacao_servico_controller.dart';
import 'package:connect/app/theme/app_text_theme.dart';
import 'package:connect/app/widgets/custom_button_widget.dart';
import 'package:connect/app/widgets/custom_iconbuttonback_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AvaliacaoServicoPage extends StatelessWidget {

//repository injection
static final ServicoRepository repository = ServicoRepository(apiClient: ApiClient(httpClient: http.Client()));
final AvaliacaoServicoController controller = Get.put(AvaliacaoServicoController(repository: repository));

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButtonBackWidget(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 4,
                    ),
                    Container(
                      width: Get.width,
                      child: Text(
                        'Serviço \n${controller.servico.nome}',
                        style: titulo,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 15,
                    ),
                    Text('Avalie este serviço'),
                    SizedBox(
                      height: 32,
                    ),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      height: 60,
                      width: 310,
                      decoration: BoxDecoration(
                        color: Color(0xffF2F2F2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0, left: 4.0),
                                child: Text(
                                  'Id Ordem',
                                  style: descricao,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0, left: 4.0),
                                child: Text(
                                  '#9876543290',
                                  style: destaqueText,
                                ),
                              ), //ordem pagamento
                            ],
                          ),
                          SizedBox(width: 40),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0, left: 8.0),
                                child: Text('Data', style: descricao),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0, left: 8.0),
                                child: Text(
                                  '11 Maio 09:10 am 2020',
                                  style: destaqueText,
                                ),
                              ), //data pagamento
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 10,
                    ),
                    Container(
                      width: 300,
                      child: CustomButtonWidget(
                        text: 'Finalizar',
                        //callback: () => Get.offNamed('prestador-home'),
                        callback: () => controller.finalizar(),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}