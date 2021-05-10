import 'package:flutter/material.dart';

import '../../../../core/constants/custom_colors.dart';
import '../../../../core/navigation/services/navigation_service.dart';
import '../../../../core/user_interface/extensions/context_extension.dart';
import '../../../../core/user_interface/responsive_layout/utils/device_enums.dart';
import '../../../../core/user_interface/responsive_layout/widgets/informer_widget.dart';

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
