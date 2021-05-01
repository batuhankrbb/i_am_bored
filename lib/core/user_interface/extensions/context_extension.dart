import 'package:flutter/material.dart';

extension CustomSize on BuildContext {
  double dynamicHeight(double ratio) => MediaQuery.of(this).size.height * ratio;

  double dynamicWidth(double ratio) => MediaQuery.of(this).size.width * ratio;
}

extension CustomTheme on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  Color get primaryColor => Theme.of(this).colorScheme.primary;
  Color get secondaryColor => Theme.of(this).colorScheme.secondary;
}

extension CustomPadding on BuildContext {
  double get paddingLevel1 => 2;
  double get paddingLevel2 => 4;
  double get paddingLevel3 => 8;
  double get paddingLevel4 => 12;
  double get paddingLevel5 => 16;
  double get paddingLevel6 => 20;
  double get paddingLevel7 => 24;
  double get paddingLevel8 => 32;
  double customPadding(double padding) => padding;
}
