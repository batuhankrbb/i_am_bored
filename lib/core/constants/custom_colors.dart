import 'package:flutter/material.dart';

class CustomColor {
  CustomColor._();

  static final CustomColor _CustomColorInstance = CustomColor._();

  factory CustomColor() {
    return _CustomColorInstance;
 }

  Color black = Color(0xFF000000);
  Color white = Color(0xFFFFFFFF);
}
