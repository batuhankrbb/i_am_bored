import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../core/atom_components/bold_button.dart';
import '../../../../core/constants/custom_colors.dart';
import '../../../../core/user_interface/extensions/context_extension.dart';
import '../../../../core/user_interface/responsive_layout/widgets/informer_widget.dart';

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
            child: buildAutoSizeText(context),
          ),
        );
      },
    );
  }

  Widget buildAutoSizeText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.padding4),
      child: AutoSizeText(
        text,
        style: TextStyle(color: CustomColor().black, fontSize: 50),
        maxLines: 1,
        minFontSize: 20,
      ),
    );
  }
}
