import 'package:connect/app/data/model/cartao_model.dart';
import 'package:connect/app/data/provider/app_provider.dart';
import 'package:connect/app/data/repository/empresa_repository.dart';
import 'package:connect/app/modules/empresa/pagamento/widgets/custom_vertical_card_widget.dart';
import 'package:connect/app/theme/app_text_theme.dart';
import 'package:connect/app/widgets/custom_button_widget.dart';
import 'package:connect/app/widgets/custom_iconbuttonback_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PagamentoPage extends StatelessWidget {
//repository injection
  final EmpresaRepository repository =
      EmpresaRepository(apiClient: ApiClient(httpClient: http.Client()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
              padding: EdgeInsets.only(top:16, bottom:16),
              width: Get.width,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text(
                        'Escolha o cartão',
                        style: subtitulo,
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
    );
  }
}
