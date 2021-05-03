import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:im_bored_app/core/atom_components/bold_button.dart';
import 'package:im_bored_app/core/constants/custom_colors.dart';
import 'package:im_bored_app/core/user_interface/responsive_layout/utils/device_enums.dart';
import 'package:im_bored_app/core/user_interface/responsive_layout/widgets/informer_widget.dart';
import 'package:im_bored_app/core/user_interface/extensions/context_extension.dart';

class CustomBoldTextButton extends StatelessWidget {
  const CustomBoldTextButton(
      {Key? key, required this.text, required this.onPressed, this.widthRatio})
      : super(key: key);

  final String text;
  final VoidCallback onPressed;
  final double? widthRatio;

  @override
  Widget build(BuildContext context) {
    return InformerWidget(
      onPageBuild: (context, info) {
        return Container(
          height: info.screenSize.height * 0.06,
          width: info.screenSize.width * (widthRatio ?? 0.8),
          child: BoldButton(
            onPressed: onPressed,
            child: buildAutoSizeText(),
          ),
        );
      },
    );
  }

  AutoSizeText buildAutoSizeText() {
    return AutoSizeText(
      text,
      style: TextStyle(color: CustomColor().black, fontSize: 28),
      maxLines: 1,
      minFontSize: 20,
    );
  }
}
