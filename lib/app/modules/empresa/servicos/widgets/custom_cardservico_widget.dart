import 'package:connect/app/data/model/servico_model.dart';
import 'package:flutter/material.dart';

class CustomCardServicoWidget extends Container {
  final ServicoModel servico;
  final VoidCallback callback;

  CustomCardServicoWidget({@required this.servico, this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            Expanded(
              flex: 1,
              child: Column(
                children: [
                 
                  Expanded(
                    flex: 1,
                    child: IconButton(
                        icon: Icon(Icons.remove_red_eye, size: 30, color: Colors.lightGreen,),
                        onPressed: this.callback ?? null),
                  )
                ],
              ),
            )
          ],
        ),
      
    );
  }
}
