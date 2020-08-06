import 'package:connect/app/data/model/cartao_model.dart';
import 'package:connect/app/data/provider/app_provider.dart';
import 'package:connect/app/data/repository/user_repository.dart';
import 'package:connect/app/modules/empresa/pagamento/pagamento_controller.dart';
import 'package:connect/app/modules/empresa/pagamento/widgets/custom_vertical_card_widget.dart';
import 'package:connect/app/theme/app_text_theme.dart';
import 'package:connect/app/widgets/custom_button_widget.dart';
import 'package:connect/app/widgets/custom_iconbuttonback_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PagamentoPage extends StatelessWidget {
//repository injection
  static final UserRepository repository =
      UserRepository(apiClient: ApiClient(httpClient: http.Client()));
  final PagamentoController controller = Get.put(PagamentoController(repository: repository));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
              child: SafeArea(
          child: Column(
            children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButtonBackWidget(),
                    Text(
                      'Pagamento',
                      style: subtitulo,
                    ),
                  ],
                ),
                Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: IconButton(
                        icon: Icon(
                          Icons.add,
                          color: Colors.green,
                          size: 30,
                        ),
                        onPressed: () => print('add')))
              ],
            ),
            Container(
                padding: EdgeInsets.only(top:8.0, bottom:8.0),
                width: Get.width,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          'Escolha o método de pagamento',
                          style: subtitulo,
                        )),

                        Obx(
                          () => Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Boleto',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: controller.metodoCartao
                                        ? Colors.grey
                                        : Colors.lightGreen),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                                child: GetX<PagamentoController>(
                                  init:
                                      PagamentoController(repository: repository),
                                  initState: (_) {},
                                  builder: (_) {
                                    return Switch(
                                        value: controller.metodoCartao,
                                        onChanged: (value) =>
                                            controller.onChangeSwitch(value));
                                  },
                                ),
                              ),
                              Text('Cartão',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: !controller.metodoCartao
                                          ? Colors.grey
                                          : Colors.lightGreen))
                            ],
                          ),
                        ),
                        
                      Container(
                        margin: EdgeInsets.only(top: 16),
                        height: Get.height / 2.8,
                        width: Get.width,
                        child:
                            ListView(scrollDirection: Axis.horizontal, children: [
                              CustomCardVerticalWidget(
                                cartao: CartaoModel(
                                  banco: 'Visa',
                                  numero: '1234567812341234',
                                  nome: 'Kauê Tomaz Murakami',
                                  validade: '01/20'
                                ),
                              ),
                              CustomCardVerticalWidget(
                                cartao: CartaoModel(
                                  banco: 'Visa',
                                  numero: '1234567812341234',
                                  nome: 'Kauê Tomaz Murakami',
                                  validade: '01/20'
                                ),
                              ),
                              CustomCardVerticalWidget(
                                cartao: CartaoModel(
                                  banco: 'Visa',
                                  numero: '1234567812341234',
                                  nome: 'Kauê Tomaz Murakami',
                                  validade: '01/20'
                                ),
                              ),
                              CustomCardVerticalWidget(
                                cartao: CartaoModel(
                                  banco: 'Visa',
                                  numero: '1234567812341234',
                                  nome: 'Kauê Tomaz Murakami',
                                  validade: '01/20'
                                ),
                              )
                        ]),
                      ),
                    ])),
                    SizedBox(height: Get.height/6),
                    Container(
                      height: Get.height/4,
                      padding: EdgeInsets.all(16),
                      width: Get.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Desconto', style: TextStyle(color:Colors.grey, fontWeight: FontWeight.bold, fontSize: 16),),
                              Text('R\$10,00'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Valor', style: TextStyle(color:Colors.grey, fontWeight: FontWeight.bold, fontSize: 16),),
                              Text('R\$50,00'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Total', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                              Text('R\$40,00', style: destaqueText,),
                            ],
                          ),
                          CustomButtonWidget(text: 'Finalizar', callback: ()=> print('finalizado'),)
                        ],
                      ),
                    )
          ]),
        ),
      ),
    );
  }
}
