import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../../../../core/user_interface/extensions/context_extension.dart';

class CustomAutoSizeText extends StatelessWidget {
  const CustomAutoSizeText(
      {Key? key,
      required this.text,
      this.padding = 0,
      this.fontSize = 40,
      this.maxLines = 1,
      this.textAlign,
      this.fontFamily = "Helvetica"})
      : super(key: key);

  final double padding;
  final double fontSize;
  final int? maxLines;
  final String text;
  final String fontFamily;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: AutoSizeText(
        text,
        textAlign: textAlign,
        style: TextStyle(
            color: context.secondaryColor,
            fontSize: fontSize,
            fontFamily: fontFamily),
        maxLines: maxLines,
        minFontSize: 8,
      ),
    );
  }
}
