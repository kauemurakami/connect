import 'package:connect/app/data/provider/app_provider.dart';
import 'package:connect/app/data/repository/user_repository.dart';
import 'package:connect/app/modules/login/login_controller.dart';
import 'package:connect/app/routes/app_pages.dart';
import 'package:connect/app/theme/app_text_theme.dart';
import 'package:connect/app/widgets/custom_button_widget.dart';
import 'package:connect/app/widgets/custom_textff_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatelessWidget {
//repository injection
  final UserRepository repository =
      UserRepository(apiClient: ApiClient(httpClient: http.Client()));
  static GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Login',
                  style: titulo,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    'Faça o login abaixo',
                    style: descricao,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 10),
                GetX<LoginController>(
                    init: LoginController(repository: this.repository),
                    builder: (_) {
                      return Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            CustomTextFormField(
                              type: TextInputType.emailAddress,
                              text: 'Email',
                              onChanged: (value) => _.onChangeEmail(value),
                              onSaved: (value) => _.onSavedEmail(value),
                              validator: (value) => _.emailValidate(value),
                              action: TextInputAction.next,
                              sufixIcon: Icon(
                                Icons.check_circle,
                                color:
                                    _.isEmailCheck ? Colors.green : Colors.grey,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CustomTextFormField(
                              obscure: _.obscure,
                              type: TextInputType.text,
                              text: 'Senha',
                              onChanged: (value) => _.user.senha = value,
                              onSaved: (value) => _.onSavedPassword(value),
                              validator: (value) => _.passwordValidate(value),
                              action: TextInputAction.next,
                              sufixIcon: GestureDetector(
                                onLongPress: () => _.showPassword(),
                                onLongPressEnd: (details) => _.showPassword(),
                                child: Icon(
                                  Icons.remove_red_eye,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 24.0, bottom: 24.0),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: GestureDetector(
                                  onTap: () => Get.toNamed(Routes.RECU_SENHA),
                                  child: Text(
                                    'Esqueceu sua senha?',
                                    style: textInfo,
                                  ),
                                ),
                              ),
                            ),
                            CustomButtonWidget(
                                text: 'Entrar',
                                callback: () {
                                  final FormState form = _formKey.currentState;
                                  if (form.validate()) {
                                    form.save();
                                    _.login();
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
