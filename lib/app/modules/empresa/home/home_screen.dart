import 'package:connect/app/data/provider/app_provider.dart';
import 'package:connect/app/data/repository/empresa_repository.dart';
import 'package:connect/app/data/repository/user_repository.dart';
import 'package:connect/app/modules/empresa/empresa_controller.dart';
import 'package:connect/app/widgets/custom_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends GetView {
//repository injection
static final UserRepository repository = UserRepository(apiClient: ApiClient(httpClient: http.Client()));

  final EmpresaController controller = Get.put(EmpresaController(repository: repository));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          bgColor: Colors.green,
          color: Colors.white,
          text: controller.user.nome,
          iconsColor: Colors.white,
          icons: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.chat_bubble_outline,
                  color: Colors.white,
                ),
                onPressed: ()=> controller.chat()),
            IconButton(
                icon: Icon(
                  Icons.notifications_none,
                  color: Colors.white,
                ),
                onPressed: ()=> controller.notificacoes()),
          ],
        ),
      body: Container(
        height: 60,
        width: 60,
        child: Text('aaaaaaaaaaaa'),
      ),
    );
  }
}
