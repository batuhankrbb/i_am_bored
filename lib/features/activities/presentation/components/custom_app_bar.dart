import 'package:flutter/material.dart';
import 'package:im_bored_app/core/navigation/services/navigation_service.dart';

class CustomAppBar extends AppBar {
  @override
  Widget? get leading => IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
        ),
        onPressed: () {
          NavigationService().goBack();
        },
      );

  @override
  double? get elevation => 0;

  @override
  Color? get backgroundColor => Colors.transparent;
}
