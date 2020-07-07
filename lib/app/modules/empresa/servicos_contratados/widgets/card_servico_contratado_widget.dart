import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CustomCardServicoContratadoWidget extends StatelessWidget {

  final String servico;
  final int codigo;
  final String data;
  final String status;

  CustomCardServicoContratadoWidget({this.codigo = 1, this.data = '22/10', this.servico = 'limpeza', this.status = 'concluido'});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16.0),
      child: Row(
        children: [
          Container(
            width: 10,
            height: 80,
            color: Colors.blue,
          ),
          Container(
            width: Get.width/1.2,
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${this.servico}  ${this.codigo}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(this.data, style: TextStyle(color: Colors.grey),)),
                  Text(this.status, style: TextStyle(color: Colors.grey),),
                ],
              ))
        ],
      ),
    );
  }
}
