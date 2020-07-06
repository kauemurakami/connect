import 'package:connect/app/theme/app_text_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSmallButtonWidget extends RaisedButton {
  final String text;
  final int index;
  final VoidCallback callback;
  final int item;
  
  CustomSmallButtonWidget(
      {this.text, this.index, this.callback, this.item,});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: RaisedButton(
      color: this.item == index ? Colors.green : Colors.grey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Text(
        this.text,
        style: whiteColor,
      ),
      onPressed: this.callback,
    ));
  }
}
