import 'package:connect/app/data/provider/app_provider.dart';
import 'package:connect/app/data/repository/empresa_repository.dart';
import 'package:connect/app/modules/empresa/agendamento/agendamento_controller.dart';
import 'package:connect/app/modules/empresa/pagamento/custom_dropdown_widget.dart';
import 'package:connect/app/theme/app_text_theme.dart';
import 'package:connect/app/widgets/custom_button_widget.dart';
import 'package:connect/app/widgets/custom_iconbuttonback_widget.dart';
import 'package:connect/app/widgets/custom_textff_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class AgendarContratacaoPage extends StatelessWidget {
//repository injection
  static final EmpresaRepository repository =
      EmpresaRepository(apiClient: ApiClient(httpClient: http.Client()));

  final GlobalKey _key = GlobalKey<FormState>();

  final AgendarContratacaoController controller =
      Get.put(AgendarContratacaoController(repository: repository));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
              child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  IconButtonBackWidget(),
                  Text(controller.servico.nome, style: subtitulo,),
                ],
              ),
              Container(
                height: Get.height / 1.6,
                margin: EdgeInsets.all(24),
                  child: Form(
                key: _key,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //todos os serviços de um prestador ??
                    CustomTextFormField(
                      text: 'Descrição do trabalho',
                    ),
                    CustomTextFormField(text: 'Categoria'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width / 3,
                          child: CustomTextFormField(
                            type: TextInputType.datetime,
                            direction: TextDirection.rtl,
                            action: TextInputAction.next,
                            text: 'Data',
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 3,
                          child: FocusScope(
                            child: Focus(
                              child: CustomTextFormField(
                                type: TextInputType.number,
                                direction: TextDirection.rtl,
                                action: TextInputAction.next,
                                text: 'Certificados',
                                max: 3,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    CustomTextFormField(text: 'Cidade'),
                    CustomTextFormField(text: 'Documentação necessária'),
                    SizedBox(height: 40),
                    CustomButtonWidget(text: 'Agendar', callback: () => controller.agendar())
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
