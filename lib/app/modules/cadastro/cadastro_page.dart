import 'package:connect/app/data/provider/app_provider.dart';
import 'package:connect/app/data/repository/user_repository.dart';
import 'package:connect/app/modules/cadastro/cadastro_controller.dart';
import 'package:connect/app/theme/app_text_theme.dart';
import 'package:connect/app/widgets/custom_button_widget.dart';
import 'package:connect/app/widgets/custom_iconbuttonback_widget.dart';
import 'package:connect/app/widgets/custom_textff_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CadastroPage extends GetView {
//repository injection
  static final UserRepository repository =
      UserRepository(apiClient: ApiClient(httpClient: http.Client()));
  static final GlobalKey formKey = GlobalKey<FormState>();
  final CadastroController controller =
      Get.put(CadastroController(repository: repository));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              IconButtonBackWidget(),
              Container(
                padding: EdgeInsets.all(32),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Cadastro',
                        style: titulo,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          'Cadastre-se abaixo prestador e/ou empresa',
                          style: descricao,
                        ),
                      ),
                      Obx(
                        () => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Prestador',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: controller.isEmpresa
                                      ? Colors.grey
                                      : Colors.lightGreen),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 16, bottom: 16),
                              child: GetX<CadastroController>(
                                init:
                                    CadastroController(repository: repository),
                                initState: (_) {},
                                builder: (_) {
                                  return Switch(
                                      value: controller.isEmpresa,
                                      onChanged: (value) =>
                                          controller.onChangeSwitch(value));
                                },
                              ),
                            ),
                            Text('Empresa',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: !controller.isEmpresa
                                        ? Colors.grey
                                        : Colors.lightGreen))
                          ],
                        ),
                      ),
                      GetX<CadastroController>(
                          init: CadastroController(repository: repository),
                          builder: (_) {
                            return Form(
                              key: formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  CustomTextFormField(
                                    onSaved: (value) => _.onSavedName(value),
                                    action: TextInputAction.next,
                                    text: 'Nome',
                                  ),
                                  CustomTextFormField(
                                    onChanged: (value) =>
                                        _.onChangeEmail(value),
                                    onSaved: (value) => _.onSavedEmail(value),
                                    validator: (value) =>
                                        _.emailValidate(value),
                                    action: TextInputAction.next,
                                    text: 'Email de usuário',
                                    type: TextInputType.emailAddress,
                                    sufixIcon: Icon(
                                      Icons.check_circle,
                                      color: _.isEmailCheck
                                          ? Colors.green
                                          : Colors.grey,
                                    ),
                                  ),
                                  CustomTextFormField(
                                    onSaved: (value) =>
                                        _.onSavedTelefone(value),
                                    validator: (value) =>
                                        _.telefoneValidate(value),
                                    action: TextInputAction.next,
                                    max: 11,
                                    text: 'Telefone',
                                    type: TextInputType.number,
                                  ),
                                  CustomTextFormField(
                                    onSaved: (value) => _.onSavedEstado(value),
                                    validator: (value) => value.length > 3
                                        ? null
                                        : 'insira um estado válido',
                                    action: TextInputAction.next,
                                    type: TextInputType.text,
                                    text: 'Estado',
                                  ),
                                  CustomTextFormField(
                                    onSaved: (value) => _.onSavedCidade(value),
                                    validator: (value) => value.length > 3
                                        ? null
                                        : 'insira uma cidade válida',
                                    type: TextInputType.text,
                                    action: TextInputAction.next,
                                    text: 'Cidade',
                                  ),
                                  CustomTextFormField(
                                    type: TextInputType.text,
                                    onSaved: (value) =>
                                        _.onSavedEndereco(value),
                                    validator: (value) => value.length > 5
                                        ? null
                                        : 'insira um endereço válido',
                                    action: TextInputAction.next,
                                    text: 'Endereco',
                                  ),
                                  CustomTextFormField(
                                    onSaved: (value) => _.onSavedCpfCnpj(value),
                                    validator: (value) => value.length > 10
                                        ? null
                                        : 'insira um cnpn ou cpf válido',
                                    action: TextInputAction.next,
                                    type: TextInputType.number,
                                    max: 14,
                                    text: !_.isEmpresa ? 'CPF / CNPJ' : 'CNPJ',
                                  ),
                                  CustomTextFormField(
                                    obscure: _.obscure,
                                    max: 12,
                                    type: TextInputType.text,
                                    text: 'Senha',
                                    onSaved: (value) =>
                                        _.onSavedPassword(value),
                                    validator: (value) =>
                                        _.passwordValidate(value),
                                    action: TextInputAction.next,
                                    sufixIcon: GestureDetector(
                                      onLongPress: () => _.showPassword(),
                                      onLongPressEnd: (details) =>
                                          _.showPassword(),
                                      child: Icon(
                                        Icons.remove_red_eye,
                                      ),
                                    ),
                                  ),
                                  CustomTextFormField(
                                    max: 12,
                                    obscure: _.obscure,
                                    type: TextInputType.text,
                                    text: 'Confirmar senha',
                                    onSaved: (value) =>
                                        _.onSavedPassword(value),
                                    validator: (value) =>
                                        _.passwordValidate(value),
                                    action: TextInputAction.next,
                                    sufixIcon: GestureDetector(
                                      onLongPress: () => _.showPassword(),
                                      onLongPressEnd: (details) =>
                                          _.showPassword(),
                                      child: Icon(
                                        Icons.remove_red_eye,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 24,
                                  ),
                                  CustomButtonWidget(text: 'aaaa', callback: () async => controller.c(),),
                                  CustomButtonWidget(
                                      text: 'Cadastrar',
                                      callback: () async {
                                        final FormState form =
                                            formKey.currentState;
                                        if (form.validate()) {
                                          form.save();
                                          //_.cadastrar();
                                        } else {
                                          //snackbar
                                          print('erro ao entrar');
                                        }
                                      }),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 30.0),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: GestureDetector(
                                        onTap: () => Get.back(),
                                        child: Text(
                                          'Já tem uma conta?',
                                          style: destaqueText,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
