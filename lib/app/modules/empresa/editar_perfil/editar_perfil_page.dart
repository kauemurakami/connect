import 'package:connect/app/data/provider/app_provider.dart';
import 'package:connect/app/data/repository/empresa_repository.dart';
import 'package:connect/app/modules/empresa/editar_perfil/editar_perfil_controller.dart';
import 'package:connect/app/routes/app_pages.dart';
import 'package:connect/app/widgets/custom_button_widget.dart';
import 'package:connect/app/widgets/custom_iconbuttonback_widget.dart';
import 'package:connect/app/widgets/custom_textff_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class EditarPerfilPage extends GetView {
//repository injection
  static final EmpresaRepository repository =
      EmpresaRepository(apiClient: ApiClient(httpClient: http.Client()));
  final EditarPerfilController controller =
      Get.put(EditarPerfilController(repository: repository));
  final GlobalKey _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        IconButtonBackWidget(),
        Container(
          padding: EdgeInsets.all(16),
          child: Stack(children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: (NetworkImage(
                      'https://source.unsplash.com/random/150x150')),
                ),
              ),
            ),
            Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: IconButton(
                      icon: Icon(
                        Icons.camera_alt,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        print('alterar foto');
                      }),
                ))
          ]),
        ),
        Flexible(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Form(
                key: this._formKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      text: 'Nome',
                      onSaved: (value) => controller.nameValidate(value),
                      validator: (value) => controller.nameValidate(value),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:16.0, bottom:16.0),
                      child: Obx(() => CustomTextFormField(
                            type: TextInputType.emailAddress,
                            text: 'Email',
                            onChanged: (value) => controller.onChangeEmail(value),
                            onSaved: (value) => controller.onSavedEmail(value),
                            validator: (value) => controller.emailValidate(value),
                            action: TextInputAction.next,
                            sufixIcon: Icon(
                              Icons.check_circle,
                              color: controller.isEmailCheck
                                  ? Colors.green
                                  : Colors.grey,
                            ),
                          )),
                    ),
                    Obx(() => CustomTextFormField(
                          type: TextInputType.emailAddress,
                          text: 'Telefone',
                          onChanged: (value) =>
                              controller.onChangeTelefone(value),
                          onSaved: (value) => controller.onSavedTelefone(value),
                          validator: (value) =>
                              controller.telefoneValidate(value),
                          action: TextInputAction.next,
                          sufixIcon: Icon(
                            Icons.check_circle,
                            color: controller.isTelefoneCheck
                                ? Colors.green
                                : Colors.grey,
                          ),
                        )),
                    //lista de prestadores ????
                    SizedBox(height: MediaQuery.of(context).size.height / 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 200,
                          child: CustomButtonWidget(
                              text: 'Salvar',
                              callback: () {
                                final FormState form = _formKey.currentState;
                                if (form.validate()) {
                                  form.save();
                                  //controller.cadastrar
                                  //Get.offAllNamed('/');
                                } else {
                                  //snackbar
                                  Get.toNamed(Routes.EDIT_PERFIL_EMPRESA);
                                  print('erro ao entrar');
                                }
                              }),
                        )
                      ],
                    )
                  ],
                )),
          ),
        )
      ]),
    ));
  }
}
