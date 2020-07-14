import 'package:connect/app/data/model/servico_model.dart';
import 'package:connect/app/modules/empresa/add_servico/add_servico_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDropDownmButtonWidget extends GetView {
  final AddServicoController controller = Get.find<AddServicoController>();
  final List<ServicoModel> servicos;

  CustomDropDownmButtonWidget({@required this.servicos});

  List<DropdownMenuItem<ServicoModel>> builDropdownMenuItems(
      List<ServicoModel> servicos) {
    List<DropdownMenuItem<ServicoModel>> items = List();
    for (ServicoModel servico in servicos) {
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
    return Container(
      margin: EdgeInsets.all(16),
        child: DropdownButton<ServicoModel>(
      value: null,
      hint: Text("Selecione o Serviço"),
      icon: Icon(Icons.arrow_drop_down),
      iconSize: 20,
      elevation: 16,
      underline: Container(height: 2, color: Theme.of(context).accentColor),
      onChanged: (value) => controller.onChangeDropdownItem(value),
      items: builDropdownMenuItems(this.servicos),
    ));
  }
}
