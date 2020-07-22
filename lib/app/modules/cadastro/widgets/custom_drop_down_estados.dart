import 'package:connect/app/data/model/estado_model.dart';
import 'package:connect/app/modules/cadastro/cadastro_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CustomDropDownEstados extends GetView {

  final CadastroController controller = Get.find<CadastroController>();

  @override
  Widget build(BuildContext context) {
    return 
    
    Container(
        child: Obx(() => DropdownButton<Estado>(
          value: controller.selectedEstado,
          hint: Text("Selecione seu estado"),
          icon: Icon(Icons.arrow_drop_down),
          iconSize: 24,
          elevation: 16,
          style: TextStyle(fontSize: 24),
          items: builDropdownMenuItems(controller.estados),
          underline: Container(height: 2, color: Theme.of(context).accentColor),
          onChanged: (value) => controller.onChangeEstados(value),
        )),

    );
  }

  List<DropdownMenuItem<Estado>> builDropdownMenuItems(List<Estado> estados) {
    List<DropdownMenuItem<Estado>> items = List();
    for (Estado estado in estados) {
      items.add(DropdownMenuItem(
        value: estado,
        child: Text(
          estado.nome,
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ));
    }
    return items;
  }
}
