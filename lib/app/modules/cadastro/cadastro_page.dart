import 'package:connect/app/data/provider/app_provider.dart';
import 'package:connect/app/data/repository/user_repository.dart';
import 'package:connect/app/modules/cadastro/cadastro_controller.dart';
import 'package:connect/app/routes/app_pages.dart';
import 'package:connect/app/theme/app_text_theme.dart';
import 'package:connect/app/widgets/custom_button_widget.dart';
import 'package:connect/app/widgets/custom_iconbuttonback_widget.dart';
import 'package:connect/app/widgets/custom_textff_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CadastroPage extends GetView<CadastroController> {
//repository injection
  static final UserRepository repository =
      UserRepository(apiClient: ApiClient(httpClient: http.Client()));
  static final GlobalKey _formKey = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
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
                      SizedBox(height: MediaQuery.of(context).size.height / 10),
                      GetX<CadastroController>(
                          init: CadastroController(repository: repository),
                          builder: (_) {
                            return Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  CustomTextFormField(
                                    onSaved: (value) => _.onSavedName(value),
                                    validator: (value) => _.nameValidate(value),
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
                                    sufixIcon: Icon(
                                      Icons.check_circle,
                                      color: _.isEmailCheck
                                          ? Colors.green
                                          : Colors.grey,
                                    ),
                                  ),
                                  CustomTextFormField(
                                    controller: _pass,
                                    obscure: _.obscure,
                                    type: TextInputType.emailAddress,
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
                                    controller: _confirmPass,
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
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Prestador', style: TextStyle(color: controller.isEmpresa ? Colors.grey : Colors. lightGreen),),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 16, bottom: 16),
                                        child: Switch(
                                            value: controller.isEmpresa,
                                            onChanged: (value) => controller.onChangeSwitch(value)),
                                      ),
                                      Text('Empresa', style: TextStyle(color: !controller.isEmpresa ? Colors.grey : Colors. lightGreen))
                                    ],
                                  ),
                                  CustomButtonWidget(
                                      text: 'Cadastrar',
                                      callback: () {
                                        final FormState form =
                                            _formKey.currentState;
                                        if (form.validate()) {
                                          form.save();
                                          //_.cadastrar
                                          //Get.offAllNamed('/');
                                        } else {
                                          //snackbar
                                          Get.toNamed(Routes.ADD_CARTAO);
                                          print('erro ao entrar');
                                        }
                                      }),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 40.0),
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
