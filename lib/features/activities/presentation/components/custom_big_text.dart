import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:im_bored_app/core/user_interface/extensions/context_extension.dart';

class CustomBigText extends StatelessWidget {
  const CustomBigText({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      style: TextStyle(color: context.secondaryColor, fontSize: 300),
      minFontSize: 25,
      wrapWords: false,
    );
  }
}
