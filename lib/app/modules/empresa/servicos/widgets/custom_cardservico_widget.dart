import 'package:connect/app/data/model/servico_model.dart';
import 'package:connect/app/modules/empresa/servicos/servicos_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCardServicoWidget extends GestureDetector {
  final ServicoModel servico;

  CustomCardServicoWidget({@required this.servico});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.find<ServicosController>().servicoDetalhes(this.servico),
      child: Container(
        height: 100,
        margin: EdgeInsets.only(left: 20, right: 20, top: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey)),
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(
                      'https://source.unsplash.com/random/150x150',
                    ))),
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      this.servico.nome,
                      style: TextStyle(fontSize: 16),
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Text(
                        this.servico.data,
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
