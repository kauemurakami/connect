import 'package:connect/app/data/provider/app_provider.dart';
import 'package:connect/app/data/repository/servico_repository.dart';
import 'package:connect/app/modules/empresa/avaliacao_servico/avaliacao_servico_controller.dart';
import 'package:connect/app/modules/empresa/avaliacao_servico/widgets/icon_rating_widget.dart';
import 'package:connect/app/theme/app_text_theme.dart';
import 'package:connect/app/widgets/custom_button_widget.dart';
import 'package:connect/app/widgets/custom_iconbuttonback_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AvaliacaoServicoPage extends GetView {
//repository injection
  static final ServicoRepository repository =
      ServicoRepository(apiClient: ApiClient(httpClient: http.Client()));
  final AvaliacaoServicoController controller =
      Get.put(AvaliacaoServicoController(repository: repository));
  final List<Icon> icons = [
    Icon(
      Icons.sentiment_very_dissatisfied,
    ),
    Icon(
      Icons.sentiment_dissatisfied,
    ),
    Icon(
      Icons.sentiment_neutral,
    ),
    Icon(
      Icons.sentiment_satisfied,
    ),
    Icon(
      Icons.sentiment_very_dissatisfied,
    ),
  ];
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
                        'Avalie este servico',
                        style: titulo,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 15,
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      height: 60,
                      width: 350,
                      decoration: BoxDecoration(
                        color: Color(0xffF2F2F2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            height: 80,
                            width: 300,
                            child: ListView.builder(
                                itemCount: this.icons.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return 
                                      Obx(()=>IconRatingWidget(
                                        icon: icons[index],
                                        callback: () => controller.selectItem(index),
                                        index: index,
                                        item: controller.selectedItem,
                                      ));
                                }),
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
