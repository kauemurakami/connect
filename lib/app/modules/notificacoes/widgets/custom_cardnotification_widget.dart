import 'package:flutter/material.dart';

class CustomCardNotificacao extends Container {
  final String notificacao;
  final String data;

  CustomCardNotificacao(this.notificacao, this.data);

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
                  image: DecorationImage(
                      image: NetworkImage(
                'https://source.unsplash.com/random/150x150',
              ))),
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    this.notificacao,
                    style: TextStyle(fontSize: 16),
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Text(
                      this.data,
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
