import 'package:connect/app/data/model/servicos_categoria.dart';
import 'package:connect/app/modules/empresa/add_servico/add_servico_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDropDownmServicosCategoriaWidget extends GetView {
  final AddServicoController controller = Get.find<AddServicoController>();
  
  final List<Servicos> servicos;

  CustomDropDownmServicosCategoriaWidget({ this.servicos});

  List<DropdownMenuItem<Servicos>> builDropdownMenuItems(
      List<Servicos> servicos ) {
    List<DropdownMenuItem<Servicos>> items = List();
    for (Servicos servico in servicos ) {
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
        child: DropdownButton<Servicos>(
      value: null,
      hint: Text("Selecione um Serviço", style: TextStyle(fontSize: 20.0),),
      icon: Icon(Icons.arrow_drop_down),
      iconSize: 20,
      elevation: 16,
      underline: Container(height: 2, color: Theme.of(context).accentColor),
      onChanged: (value) => controller.onChangeDropdownItemServico(value),
      items: builDropdownMenuItems(this.servicos),
    )) : Center(child:CircularProgressIndicator());
  }
}
