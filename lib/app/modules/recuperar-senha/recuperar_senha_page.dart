import 'package:connect/app/data/provider/app_provider.dart';
import 'package:connect/app/data/repository/user_repository.dart';
import 'package:connect/app/modules/recuperar-senha/recuperar_senha_controller.dart';
import 'package:connect/app/routes/app_pages.dart';
import 'package:connect/app/theme/app_text_theme.dart';
import 'package:connect/app/widgets/custom_button_widget.dart';
import 'package:connect/app/widgets/custom_iconbuttonback_widget.dart';
import 'package:connect/app/widgets/custom_textff_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RecuperarSenhaPage extends StatelessWidget {
  final UserRepository repository =
      UserRepository(apiClient: ApiClient(httpClient: http.Client()));
  static GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                      'Recuperar Senha',
                      style: titulo,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Recupere sua senha através do email.',
                        style: descricao,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 10),
                    GetX<RecuperarSenhaController>(
                        init: RecuperarSenhaController(
                            repository: this.repository),
                        builder: (_) {
                          return Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                CustomTextFormField(
                                  type: TextInputType.emailAddress,
                                  onChanged: (value) => _.onChangeEmail(value),
                                  onSaved: (value) => _.onSavedEmail(value),
                                  validator: (value) => _.emailValidate(value),
                                  action: TextInputAction.next,
                                  text: 'Email de usuário',
                                  sufixIcon: Icon(
                                    Icons.check_circle,
                                    color: _.isEmailCheck
                                        ? Colors.green
                                        : Colors.grey,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(24.0),
                                  child: _.sucesso.length > 0
                                      ? Text(
                                          _.sucesso,
                                          style: TextStyle(color: Colors.black),
                                        )
                                      : Text(
                                          '',
                                          style: TextStyle(color: Colors.red),
                                        ),
                                ),
                                CustomButtonWidget(
                                    text: 'Enviar',
                                    callback: () {
                                      final FormState form =
                                          _formKey.currentState;
                                      if (form.validate()) {
                                        form.save();
                                        _.recuperarSenha();
                                      } else {
                                        //snackbar
                                        print('erro ao entrar');
                                      }
                                    }),
                                Padding(
                                  padding: const EdgeInsets.only(top: 40.0),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: GestureDetector(
                                      onTap: () => Get.toNamed(Routes.CADASTRO),
                                      child: Text(
                                        'Você não tem cadastro? Clique aqui',
                                        style: textInfo,
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
    );
  }
}
