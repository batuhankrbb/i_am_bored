import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../../core/user_interface/extensions/context_extension.dart';

class CustomBigText extends StatelessWidget {
  const CustomBigText({Key? key, required this.texts}) : super(key: key);

  final List<String> texts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return AutoSizeText(
          texts[index],
          style: TextStyle(
            color: context.secondaryColor,
            fontSize: 100,
          ),
          minFontSize: 25,
        );
      },
      itemCount: texts.length,
      physics: NeverScrollableScrollPhysics(),
    );
  }
}

/*

*/
