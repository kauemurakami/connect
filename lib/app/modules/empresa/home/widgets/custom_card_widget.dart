import 'package:connect/app/data/model/cadastros_model.dart';
import 'package:connect/app/modules/empresa/empresa_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCardHome extends StatelessWidget {

  final Cadastro  user;
  final int index; 

  CustomCardHome({this.user, this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.find<EmpresaController>().open(),
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
                      this.user.cadastros[this.index].imgPerfil
                    ))),
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      this.user.cadastros[index].nome,
                      style: TextStyle(fontSize: 16),
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                 
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}