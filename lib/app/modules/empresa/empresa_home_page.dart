import 'package:connect/app/data/provider/app_provider.dart';
import 'package:connect/app/data/repository/empresa_repository.dart';
import 'package:connect/app/data/repository/user_repository.dart';
import 'package:connect/app/modules/empresa/empresa_controller.dart';
import 'package:connect/app/modules/empresa/home/empresa_home_controller.dart';
import 'package:connect/app/modules/empresa/home/home_screen.dart';
import 'package:connect/app/modules/empresa/home/widgets/bottom_navigationbar_widget.dart';
import 'package:connect/app/modules/empresa/perfil/perfil_screen.dart';
import 'package:connect/app/modules/empresa/pesquisar_prestador/pesquisar_screen.dart';
import 'package:connect/app/modules/empresa/relatorios/relatorios_screen.dart';
import 'package:connect/app/modules/empresa/servicos/servicos_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class EmpresaHomePage extends StatelessWidget {
//repository injection
  static final UserRepository repository =
      UserRepository(apiClient: ApiClient(httpClient: http.Client()));
  final EmpresaController controller = Get.put(EmpresaController(repository: repository));
  final List<Widget> telas = [
    HomeScreen(),
    PesquisarScreen(),
    EmpresaRelatoriosScreen(),
    ServicoScreen(),
    EmpresaPerfilScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: GetX<EmpresaHomeController>(
          init: EmpresaHomeController(repository: repository),
          builder: (_) {
            print(_.screen);
            return telas[_.screen];
          },
        ),
      ), // prestadores mais proximos

      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}
