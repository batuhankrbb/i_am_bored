import 'package:flutter/material.dart';
import 'package:im_bored_app/core/user_interface/responsive_layout/utils/responsive_layout_helper.dart';
import 'package:im_bored_app/core/user_interface/responsive_layout/utils/screen_information_model.dart';

class InformerWidget extends StatelessWidget {
  InformerWidget({Key? key, required this.onPageBuild}) : super(key: key);

  final Widget Function(
      BuildContext context, ScreenInformation screenInformation) onPageBuild;

  late ResponsiveLayoutHelper _helper;

  @override
  Widget build(BuildContext context) {
    _helper = ResponsiveLayoutHelper(context: context);

    return LayoutBuilder(builder: (context, boxConstraint) {
      var information =
          _helper.getAllInformations(boxConstraints: boxConstraint);

      return onPageBuild(context, information);
    });
  }
}