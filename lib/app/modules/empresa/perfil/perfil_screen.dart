import 'package:connect/app/data/provider/app_provider.dart';
import 'package:connect/app/data/repository/empresa_repository.dart';
import 'package:connect/app/modules/empresa/perfil/perfil_controller.dart';
import 'package:connect/app/modules/empresa/perfil/widgets/custom_buttonperfil_widget.dart';
import 'package:connect/app/modules/empresa/perfil/widgets/custom_exiticon_perfil_widget.dart';
import 'package:connect/app/theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class EmpresaPerfilScreen extends GetView {
//repository injection
  static final EmpresaRepository repository =
      EmpresaRepository(apiClient: ApiClient(httpClient: http.Client()));
  final PerfilController controller =
      Get.put(PerfilController(repository: repository));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: EdgeInsets.only(top: 24),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CustomExitButtonWidget(callback: (){}),
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://source.unsplash.com/random/150x150',
                    ),
                  )),
            ),
            SizedBox(height: 20),
            Text(
              'Empresa nome',
              style: titulo,
            ),
            SizedBox(height: 20),
            RaisedButton(
              child: Container(
                width: 140,
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.phone,
                      color: Colors.green,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('(16)999999999'),
                  ],
                ),
              ),
              color: Color(0xffCEECF5),
              onPressed: null,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              padding: EdgeInsets.only(top: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomButtonPerfilWidget(
                      icon: Icons.mode_edit, text: 'Editar dados', callback: ()=> controller.editarPerfil()),
                  CustomButtonPerfilWidget(
                      icon: Icons.check_box,
                      text: 'Serviços prestados e Contratados', callback: ()=> controller.servicosContratados()),
                  CustomButtonPerfilWidget(
                      icon: Icons.assignment, text: 'Relatórios', callback: ()=> controller.relatorios()),
                  CustomButtonPerfilWidget(
                      icon: Icons.star_border, text: 'Gerenciar Pagamento', callback: ()=> controller.pagamento()),
                  CustomButtonPerfilWidget(
                      icon: Icons.lock, text: 'Alterar senha', callback: ()=> controller.alterarSenha())
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
