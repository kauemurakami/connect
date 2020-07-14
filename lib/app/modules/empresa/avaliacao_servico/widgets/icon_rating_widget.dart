import 'package:flutter/material.dart';

class IconRatingWidget extends StatelessWidget {
  final Widget icon;
  final VoidCallback callback;
  final int item;
  final int index;

  IconRatingWidget(
      {@required this.icon,
      this.callback,
      this.index, 
      this.item});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: this.icon,
        iconSize: this.item == index ? 40 : 30,
        color: this.item == index ? Colors.green : Colors.grey,
        onPressed: this.callback);
  }
}
