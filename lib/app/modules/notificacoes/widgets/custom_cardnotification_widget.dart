import 'package:connect/app/data/model/notificacao_model.dart';
import 'package:connect/app/modules/notificacoes/notificacoes_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCardNotificacao extends GestureDetector {
  final NotificacaoModel notificacao;

  CustomCardNotificacao(this.notificacao);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.find<NotificacoesController>().notificacaoDetalhes(this.notificacao),
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
                      this.notificacao.notificacao,
                      style: TextStyle(fontSize: 16),
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Text(
                        this.notificacao.data,
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
