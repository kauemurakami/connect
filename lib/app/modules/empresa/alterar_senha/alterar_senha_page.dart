import 'package:connect/app/data/provider/app_provider.dart';
import 'package:connect/app/data/repository/user_repository.dart';
import 'package:connect/app/modules/empresa/alterar_senha/alterar_senha_controller.dart';
import 'package:connect/app/routes/app_pages.dart';
import 'package:connect/app/theme/app_text_theme.dart';
import 'package:connect/app/widgets/custom_button_widget.dart';
import 'package:connect/app/widgets/custom_iconbuttonback_widget.dart';
import 'package:connect/app/widgets/custom_textff_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AlterarSenhaPage extends GetView {
  static final UserRepository repository =
      UserRepository(apiClient: ApiClient(httpClient: http.Client()));

  static GlobalKey _formKey = GlobalKey<FormState>();

  final AlterarSenhaController controller =
      Get.put(AlterarSenhaController(repository: repository));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                IconButtonBackWidget(),
                Text(
                  'Alterar Senha',
                  style: subtitulo,
                )
              ],
            ),
            Container(
              padding: EdgeInsets.all(32),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: MediaQuery.of(context).size.height / 10),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          CustomTextFormField(
                            onChanged: (value) => 'a',
                            onSaved: (value) => 'a',
                            validator: (value) => 'a',
                            action: TextInputAction.next,
                            type: TextInputType.text,
                            text: 'Senha Atual',
                          ),
                          CustomTextFormField(
                            onChanged: (value) => 'a',
                            onSaved: (value) => 'a',
                            validator: (value) => 'a',
                            action: TextInputAction.next,
                            type: TextInputType.text,
                            text: 'Nova Senha',
                          ),
                          CustomTextFormField(
                            onChanged: (value) => 'a',
                            onSaved: (value) => 'a',
                            validator: (value) => 'a',
                            action: TextInputAction.next,
                            type: TextInputType.text,
                            text: 'Confirmar Senha',
                          ),
                          SizedBox(
                            height: 48,
                          ),
                          CustomButtonWidget(
                              text: 'Alterar',
                              callback: () {
                                final FormState form = _formKey.currentState;
                                if (form.validate()) {
                                  form.save();
                                  //_.alterarsenha();
                                  Get.offAllNamed(Routes.HOME_EMPRESA);
                                } else {
                                  //snackbar
                                  print('erro ao entrar');
                                }
                              }),
                        ],
                      ),
                    )
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
