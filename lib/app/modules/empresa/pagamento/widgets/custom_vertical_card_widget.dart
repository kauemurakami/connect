import 'package:connect/app/data/model/cartao_model.dart';
import 'package:connect/app/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

class CustomCardVerticalWidget extends Container {

  final CartaoModel cartao;

  CustomCardVerticalWidget({this.cartao});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              stops: [0.3, 1],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xff088A08), Color(0xff81F781)]),
          borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.only(left:16, top:16, bottom: 16),
      width: 170,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cartao.banco,
              style: cardVerticalText,
            ),
            Text(
              cartao.numero,
              style: cardVerticalText,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartao.nome,
                  style: cardVerticalText,
                ),
                SizedBox(height: 10),
                Text(
                  cartao.validade,
                  style: cardVerticalText,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
