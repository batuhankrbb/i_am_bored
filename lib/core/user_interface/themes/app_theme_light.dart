import 'package:flutter/material.dart';
import 'package:im_bored_app/core/user_interface/custom_colors.dart';

class AppThemeLight {
  AppThemeLight._();

  CustomColor _customColor = CustomColor();

  static final AppThemeLight _AppThemeLightInstance = AppThemeLight._();

  factory AppThemeLight() {
    return _AppThemeLightInstance;
  }

  ThemeData get theme => ThemeData.dark().copyWith(
      colorScheme: ColorScheme.dark()
          .copyWith(primary: _customColor.white, secondary: _customColor.black));
}
