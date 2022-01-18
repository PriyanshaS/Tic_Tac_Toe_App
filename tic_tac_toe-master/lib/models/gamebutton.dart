import 'package:flutter/material.dart';

class GameButton {
  final id;
  Color bg;
  String text;
  bool enable;
  GameButton(
      {this.id, this.bg = Colors.grey, this.text = "", this.enable = true});
}
