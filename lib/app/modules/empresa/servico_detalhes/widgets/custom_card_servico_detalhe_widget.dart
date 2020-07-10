import 'package:flutter/material.dart';

class CustomCardServicoDetalheWidget extends Container {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://source.unsplash.com/random/300x500',
            ),
          ),
          borderRadius: BorderRadius.circular(25)),
      margin: EdgeInsets.only(left: 16, top: 16, bottom: 16),
      width: 165,
      height: 200,
    );
  }
}
