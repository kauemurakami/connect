import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonPerfilWidget extends Container {
  final String text;
  final IconData icon;

  CustomButtonPerfilWidget({@required this.icon, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: EdgeInsets.only(left: 50, right: 50, top: 20),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.grey)),
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Icon(this.icon),
          ),
          Expanded(
            flex: 4,
            child: Text(this.text, style: TextStyle(fontSize: 16),)
          ),
              Expanded(
            flex: 1,
            child: Icon(Icons.arrow_forward_ios, color: Colors.grey,)
          ),
        ],
      ),
    );
  }
}
