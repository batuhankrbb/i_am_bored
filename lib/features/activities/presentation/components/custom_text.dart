import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../core/user_interface/extensions/context_extension.dart';
import '../../../../core/user_interface/responsive_layout/widgets/informer_widget.dart';

class CustomAutoSizeText extends StatelessWidget {
  const CustomAutoSizeText(
      {Key? key,
      required this.text,
      this.padding = 0,
      this.fontSize = 40,
      this.maxLines = 1,
      this.textAlign,
      this.fontFamily = "Helvetica",
      this.color,
      this.maxFontSize = double.infinity})
      : super(key: key);

  final double padding;
  final double fontSize;
  final int? maxLines;
  final String text;
  final String fontFamily;
  final TextAlign? textAlign;
  final Color? color;
  final double maxFontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: InformerWidget(onPageBuild: (context, info) {
        return AutoSizeText(
          text,
          textAlign: textAlign,
          style: TextStyle(
              color: color ?? context.secondaryColor,
              fontSize: fontSize,
              fontFamily: fontFamily),
          maxLines: maxLines,
          minFontSize: 8,
          maxFontSize: maxFontSize,
        );
      }),
    );
  }
}
