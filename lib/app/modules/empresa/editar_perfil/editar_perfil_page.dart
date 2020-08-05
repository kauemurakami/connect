import 'package:connect/app/data/provider/app_provider.dart';
import 'package:connect/app/data/repository/empresa_repository.dart';
import 'package:connect/app/data/repository/user_repository.dart';
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
  static final UserRepository repository =
      UserRepository(apiClient: ApiClient(httpClient: http.Client()));
  final EditarPerfilController controller =
      Get.put(EditarPerfilController(repository: repository));
  final GlobalKey formKey = GlobalKey<FormState>();
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
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(16),
              child: Form(
                  key: this.formKey,
                  child: Column(
                    children: [
                      CustomTextFormField(
                        text: 'Nome',
                        onSaved: (value) => controller.nameValidate(value),
                        validator: (value) => controller.nameValidate(value),
                        onChanged: (value) => controller.onChangedName(value),
                      ),
                      CustomTextFormField(
                        type: TextInputType.number,
                        text: 'CNPJ/CPF',
                        onSaved: (value) => controller.onSavedCPForCNPJ(value),
                        validator: (value) =>
                            controller.validateCPForCNPJ(value),
                        onChanged: (value) =>
                            controller.onChangedCPForCNPJ(value),
                      ),
                      CustomTextFormField(
                        type: TextInputType.number,
                        text: 'Telefone',
                        onSaved: (value) => controller.onSavedTelefone(value),
                        validator: (value) =>
                            controller.validateTelefone(value),
                        onChanged: (value) =>
                            controller.onChangedTelefone(value),
                      ),
                      CustomTextFormField(
                        text: 'Estado',
                        onSaved: (value) => controller.onSavedEstado(value),
                        validator: (value) => controller.validateEstado(value),
                        onChanged: (value) => controller.onChangedEstado(value),
                      ),
                      CustomTextFormField(
                        text: 'Cidade',
                        onSaved: (value) => controller.onSavedCidade(value),
                        validator: (value) => controller.validateCidade(value),
                        onChanged: (value) => controller.onChangedCidade(value),
                      ),

                      CustomTextFormField(
                        text: 'Endereço',
                        onSaved: (value) => controller.onSavedEndereco(value),
                        validator: (value) =>
                            controller.validateEndereco(value),
                        onChanged: (value) =>
                            controller.onChangedEndereco(value),
                      ),
                      //lista de prestadores ????
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Obx(() => controller.sucesso == true
                            ? Text('Dados alterados com sucesso')
                            : Container()),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(top: 24.0),
                            width: 200,
                            child: CustomButtonWidget(
                                text: 'Salvar',
                                callback: () {
                                  final FormState form = formKey.currentState;
                                  if (form.validate()) {
                                    form.save();
                                    controller.salvarAlteracoes();
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
          ),
        )
      ]),
    ));
  }
}
