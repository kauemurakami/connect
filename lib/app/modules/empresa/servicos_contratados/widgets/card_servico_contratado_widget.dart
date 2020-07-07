import 'package:connect/app/data/provider/app_provider.dart';
import 'package:connect/app/data/repository/empresa_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CustomCardServicoContratadoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        margin: EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 5,
              color: Colors.blue,
            ),
            Container(
                child: Column(
              children: [
                Text('Serviço : 41244'),
                Text('data'),
                Text('status'),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
