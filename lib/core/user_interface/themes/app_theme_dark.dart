import 'package:flutter/material.dart';
import 'package:im_bored_app/core/user_interface/custom_colors.dart';

class AppThemeDark {
  AppThemeDark._();

  CustomColor _customColor = CustomColor();

  static final AppThemeDark _AppThemeDarkInstance = AppThemeDark._();

  factory AppThemeDark() {
    return _AppThemeDarkInstance;
  }

  ThemeData get theme => ThemeData.dark().copyWith(
      colorScheme: ColorScheme.dark()
          .copyWith(primary: _customColor.black, secondary: _customColor.white));
}