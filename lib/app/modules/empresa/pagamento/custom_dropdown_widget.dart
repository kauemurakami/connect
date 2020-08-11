import 'package:connect/app/data/model/categoria_servico_model.dart';
import 'package:connect/app/data/model/servico_model.dart';
import 'package:connect/app/modules/empresa/add_servico/add_servico_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDropDownmButtonWidget extends GetView {
  final AddServicoController controller = Get.find<AddServicoController>();
  final List<CategoriaServicos> servicos;

  CustomDropDownmButtonWidget({ this.servicos});

  List<DropdownMenuItem<CategoriaServicos>> builDropdownMenuItems(
      List<CategoriaServicos> servicos ) {
    List<DropdownMenuItem<CategoriaServicos>> items = List();
    for (CategoriaServicos servico in servicos ) {
      items.add(DropdownMenuItem(
        value: servico,
        child: Text(
          servico.nome,
          style: TextStyle(fontSize: 16),
        ),
      ));
    }
    print(servicos);
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return controller.servicos != null ? Container(
      margin: EdgeInsets.all(16),
        child: DropdownButton<CategoriaServicos>(
      value: null,
      hint: Text("Selecione o Serviço"),
      icon: Icon(Icons.arrow_drop_down),
      iconSize: 20,
      elevation: 16,
      underline: Container(height: 2, color: Theme.of(context).accentColor),
      onChanged: (value) => controller.onChangeDropdownItem(value),
      items: builDropdownMenuItems(this.servicos),
    )) : Center(child:CircularProgressIndicator());
  }
}
