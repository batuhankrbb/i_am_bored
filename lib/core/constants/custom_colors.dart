import 'package:flutter/material.dart';

class CustomColor {
  CustomColor._();

  static final CustomColor _CustomColorInstance = CustomColor._();

  factory CustomColor() {
    return _CustomColorInstance;
  }

  Color black = Color(0xFF000000);
  Color white = Color(0xFFFFFFFF);
  Color brown = Color(0xFF795508);
  Color red = Color(0xFFe54040);
  Color transparent = Colors.transparent;
}
