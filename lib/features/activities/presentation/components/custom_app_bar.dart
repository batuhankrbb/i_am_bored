import 'package:flutter/material.dart';
import 'package:im_bored_app/core/constants/custom_colors.dart';
import 'package:im_bored_app/core/navigation/services/navigation_service.dart';
import 'package:im_bored_app/core/user_interface/responsive_layout/utils/device_enums.dart';
import 'package:im_bored_app/core/user_interface/responsive_layout/widgets/informer_widget.dart';
import 'package:im_bored_app/core/user_interface/extensions/context_extension.dart';

class CustomAppBar extends AppBar {
  @override
  Widget? get leading => InformerWidget(onPageBuild: (context, info) {
        return Padding(
          padding: EdgeInsets.all(context.padding6),
          child: IconButton(
            splashColor: CustomColor().transparent,
            focusColor: CustomColor().transparent,
            highlightColor: CustomColor().transparent,
            icon: Icon(
              Icons.arrow_back_ios,
              size: info.customDeviceType == CustomDeviceType.mobile ? 35 : 40,
            ),
            onPressed: () {
              NavigationService().goBack();
            },
          ),
        );
      });

  @override
  double? get elevation => 0;

  @override
  Color? get backgroundColor => Colors.transparent;
}
