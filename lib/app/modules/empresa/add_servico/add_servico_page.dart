import 'package:connect/app/data/provider/app_provider.dart';
import 'package:connect/app/data/repository/servico_repository.dart';
import 'package:connect/app/modules/empresa/add_servico/add_servico_controller.dart';
import 'package:connect/app/modules/empresa/add_servico/widgets/custom_dropdown_widget.dart';
import 'package:connect/app/theme/app_text_theme.dart';
import 'package:connect/app/widgets/custom_button_widget.dart';
import 'package:connect/app/widgets/custom_iconbuttonback_widget.dart';
import 'package:connect/app/widgets/custom_textff_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AddServicoPage extends StatelessWidget {
//repository injection
  static final ServicoRepository repository =
      ServicoRepository(apiClient: ApiClient(httpClient: http.Client()));

  final AddServicoController controller =
      Get.put(AddServicoController(repository: repository));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Container(
          width: Get.width,
          child: Column(
            children: [
              Row(
                children: [
                  IconButtonBackWidget(),
                  Text('Cadastrar Demanda Serviço', style: subtitulo),
                ],
              ),
              Container(
                margin: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Obx(() => CustomDropDownmButtonWidget(
                        servicos: controller.servicos)),
                    CustomTextFormField(text: 'Selecionar tipo de servico?'),
                    SizedBox(height: 30,),
                    CustomButtonWidget(
                      text: 'Add Serviço',
                      callback: () {},
                    ),
                    SizedBox(height: 30),
                    CustomTextFormField(text: 'Documentação necessária'),
                    Row(children: [
                      Expanded(child: CustomTextFormField(text: 'Data')),
                      SizedBox(width: 10,),
                      Expanded(child: CustomTextFormField(text: 'Certf. Obrigatórios'))
                    ],),
                    CustomTextFormField(text: 'Cidade'),
                    SizedBox(height: 30,),
                    CustomButtonWidget(
                      text: 'Salvar',
                      callback: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
