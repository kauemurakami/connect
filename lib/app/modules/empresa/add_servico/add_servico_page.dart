import 'package:connect/app/data/provider/app_provider.dart';
import 'package:connect/app/data/repository/servico_repository.dart';
import 'package:connect/app/modules/empresa/add_servico/add_servico_controller.dart';
import 'package:connect/app/modules/empresa/add_servico/widgets/custom_drop_down_servicos_categoria.dart';
import 'package:connect/app/modules/empresa/pagamento/widgets/custom_dropdown_widget.dart';
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

  final GlobalKey _key = GlobalKey<FormState>();

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
                child: Obx(
                  () => Form(
                    key: _key,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        controller.servicos.categoriaServicos == null
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : CustomDropDownmButtonWidget(
                                servicos: controller.servicos.categoriaServicos,
                              ),
                        controller.servicosCategoria.servicos == null
                            ? Text('Escolha uma categoria')
                            : CustomDropDownmServicosCategoriaWidget(
                                servicos: controller.servicosCategoria.servicos,
                              ),
                        SizedBox(
                          height: 30,
                        ),
                        CustomButtonWidget(
                          text: 'Adicionar Serviço',
                          callback: () => controller.addServico(),
                        ),
                        SizedBox(height: 30),
                        CustomTextFormField(
                          text: 'Documentação necessária',
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: CustomTextFormField(
                              text: 'Data',
                              type: TextInputType.datetime,
                              max: 8,
                              onChanged: (value) =>
                                  controller.onChangedData(value),
                              validator: (value) =>
                                  controller.validateData(value),
                              onSaved: (value) => controller.onSavedData(value),
                            )),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: CustomTextFormField(type: TextInputType.number,
                              text: 'Certf. Obrigatórios',
                              onChanged: (value) =>
                                  controller.onChangedCert(value),
                              validator: (value) =>
                                  controller.validateCert(value),
                              onSaved: (value) => controller.onSavedCert(value),
                            ))
                          ],
                        ),
                        CustomTextFormField(
                          text: 'Cidade',
                          type: TextInputType.text,
                          onChanged: (value) =>
                              controller.onChangedCidade(value),
                          validator: (value) =>
                              controller.validateCidade(value),
                          onSaved: (value) => controller.onSavedCidade(value),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        CustomButtonWidget(text: 'Salvar', callback: () => controller.addDemanda()),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
