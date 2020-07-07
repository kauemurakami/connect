import 'package:flutter/material.dart';

class CustomCardNotificacao extends Container {
  final String notificacao;
  final String tempo;

  CustomCardNotificacao(this.notificacao, this.tempo);

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
            
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                'https://source.unsplash.com/random/150x150',
              ))),
            ),
          ),
          Column(
            children: [
              Expanded(
                  
                  child: Text(
                    this.notificacao,
                    style: TextStyle(fontSize: 16),
                  )),
              Expanded(
                  
                  child: Text(
                    this.notificacao,
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
