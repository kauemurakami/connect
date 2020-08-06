import 'package:connect/app/data/provider/app_provider.dart';
import 'package:connect/app/data/repository/user_repository.dart';
import 'package:connect/app/modules/add_cartao/add_cartao_controller.dart';
import 'package:connect/app/modules/add_cartao/widgets/cartao_widget.dart';
import 'package:connect/app/theme/app_text_theme.dart';
import 'package:connect/app/widgets/custom_button_widget.dart';
import 'package:connect/app/widgets/custom_iconbuttonback_widget.dart';
import 'package:connect/app/widgets/custom_textff_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AdicionarCartaoPage extends GetView {
//repository injection
  static final UserRepository repository =
      UserRepository(apiClient: ApiClient(httpClient: http.Client()));
  final GlobalKey _formKey = GlobalKey<FormState>();
  final controller = Get.put(AddCartaoController(repository: repository));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButtonBackWidget(),
                  Text(
                    'Adicionar cartão',
                    style: titulo,
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 16),
                child: GetX<AddCartaoController>(
                    builder: (_) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).orientation == Orientation.landscape  ? 400 : MediaQuery.of(context).size.width / 1.0 ,
                            child: CustomCartaoWidget(
                            codigo: _.cartao.codigo,
                            nome: _.cartao.nome,
                            numero: _.cartao.numero,
                            showBack: _.showBack,
                            validade: _.cartao.validade,
                          )),
                        ],
                      );
                    }),
              ),
              
              Container(
                padding: EdgeInsets.all(16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Form(
                          key: _formKey,
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                CustomTextFormField(
                                  type: TextInputType.text,
                                  direction: TextDirection.rtl,
                                  onChanged: (value) => controller.onChangeNome(value),
                                  onSaved: (value) => controller.onSavedName(value),
                                  validator: (value) => controller.nameValidate(value),
                                  action: TextInputAction.next,
                                  text: 'Nome',
                                ),
                                CustomTextFormField(
                                  max: 16,
                                  type: TextInputType.number,
                                  direction: TextDirection.rtl,
                                  onChanged: (value) => controller.onChangeNumero(value),
                                  onSaved: (value) => controller.onSavedNumero(value),
                                  validator: (value) => controller.validateNumero(value),
                                  action: TextInputAction.next,
                                  text: 'Número do cartão',
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      child: CustomTextFormField(
                                        max: 5,
                                        type: TextInputType.datetime,
                                        direction: TextDirection.rtl,
                                        onChanged: (value) =>
                                            controller.onChangeValidade(value),
                                        onSaved: (value) =>
                                            controller.onSavedValidade(value),
                                        validator: (value) =>
                                            controller.validateValidade(value),
                                        action: TextInputAction.next,
                                        text: 'Validade',
                                      ),
                                    ),
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      child: FocusScope(
                                        child: Focus(
                                          onFocusChange: (value) =>
                                              controller.showBackCodigo(),
                                          child: CustomTextFormField(
                                            type: TextInputType.number,
                                            direction: TextDirection.rtl,
                                            onChanged: (value) =>
                                              controller.onChangeCodigo(value),
                                            onSaved: (value) =>
                                                controller.onSavedCodigo(value),
                                            validator: (value) =>
                                                controller.validateCodigo(value),
                                            action: TextInputAction.next,
                                            text: 'Código',
                                            max: 3,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 48,
                                ),
                                CustomButtonWidget(
                                    text: 'Adicionar',
                                    callback: () {
                                      Get.offNamed('confirmacao-pagamento');
                                      final FormState form =
                                          _formKey.currentState;
                                      if (form.validate()) {
                                        form.save();
                                        //_.cadastrar();
                                        //Get.toNamed('confirmacao-pagamento');
                                      } else {
                                        //snackbar
                                        print('erro ao entrar');
                                      }
                                    }),
                              ],
                            ),
                          ),
                        )
                      
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AdicionarCartaoController {}
