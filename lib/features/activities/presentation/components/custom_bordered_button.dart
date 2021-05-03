import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:im_bored_app/core/user_interface/extensions/context_extension.dart';
import 'package:im_bored_app/core/user_interface/responsive_layout/widgets/informer_widget.dart';

class CustomBorderedButton extends StatelessWidget {
  const CustomBorderedButton(
      {Key? key, required this.text, required this.onPressed, this.widthRatio})
      : super(key: key);

  final String text;
  final VoidCallback onPressed;
  final double? widthRatio;

  @override
  Widget build(BuildContext context) {
    return InformerWidget(onPageBuild: (context, info) {
      return Container(
        width: info.screenSize.width * (widthRatio ?? 0.8),
        height: info.screenSize.height * 0.04,
        decoration: BoxDecoration(
          border: Border.all(color: context.secondaryColor, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: buildAutoSizeText(context),
      );
    });
  }

  Widget buildAutoSizeText(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.padding4),
      alignment: Alignment.center,
      child: AutoSizeText(
        text,
        maxLines: 1,
        style: TextStyle(fontSize: 50, color: context.secondaryColor),
        minFontSize: 12,
      ),
    );
  }
}
