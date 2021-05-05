import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../core/user_interface/extensions/context_extension.dart';
import '../../../../core/user_interface/responsive_layout/widgets/informer_widget.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.maxLine = 1,
      this.textAlign})
      : super(key: key);

  final VoidCallback onPressed;
  final String text;
  final int maxLine;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return InformerWidget(onPageBuild: (context, info) {
      return TextButton(
        onPressed: onPressed,
        child: buildAutoSizeText(context),
        style: TextButton.styleFrom(primary: context.secondaryColor),
      );
    });
  }

  AutoSizeText buildAutoSizeText(BuildContext context) {
    return AutoSizeText(
      text,
      style: TextStyle(fontSize: 55),
      maxLines: maxLine,
      textAlign: textAlign,
      minFontSize: 15,
    );
  }
}
