import 'package:connect/app/data/model/servico_model.dart';
import 'package:connect/app/modules/empresa/servicos_contratados_prestados/servicos_contratado_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCardServicoContratadoWidget extends StatelessWidget {
  final ServicoModel servico;

  final ServicosContratadosController controller =
      Get.find<ServicosContratadosController>();

  CustomCardServicoContratadoWidget({this.servico});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.detalhesServicoContratatoPrestado(this.servico),
      child: Container(
        margin: EdgeInsets.only(left: 16.0),
        child: Row(children: [
          Container(
            width: 10,
            height: 80,
            color: Colors.blue,
          ),
          Container(
              width: Get.width / 1.2,
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${this.servico.nome}  ${this.servico.id}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                        this.servico.data,
                        style: TextStyle(color: Colors.grey),
                      )),
                  Text(
                    this.servico.status,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              )),
        ]),
      ),
    );
  }
}
