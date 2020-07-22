import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:connect/app/data/model/cidade_model.dart';
import 'package:connect/app/modules/cadastro/cadastro_controller.dart';
import 'package:connect/app/widgets/g_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CustomTFFCidadesPage extends GetView {

  final CadastroController controller = Get.find<CadastroController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => AutoCompleteTextField<Cidade>(
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      fillColor: Colors.green,
                      border: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.green))),
                  itemSubmitted: (item) => controller.selectCidade(item),
                  key: GKeys.gKey1,
                  suggestions: this.controller.cidades,
                  itemBuilder: (context, suggestion) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        suggestion.nome,
                        style: TextStyle(fontSize: 20),
                      ),
                    );
                  },
                  itemSorter: (a, b) => a.nome.compareTo(b.nome),
                  itemFilter: (suggestion, query) => suggestion.nome
                      .toLowerCase()
                      .startsWith(query.toLowerCase()),
            ));
        }
  }
