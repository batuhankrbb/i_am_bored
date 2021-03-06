import 'package:flutter/material.dart';

import '../../../../../../../../core/user_interface/extensions/context_extension.dart';
import '../../../../../../../../core/user_interface/responsive_layout/widgets/informer_widget.dart';
import '../../../../../components/custom_text.dart';

class CustomTextButtonBetweenLines extends StatelessWidget {
  const CustomTextButtonBetweenLines(
      {Key? key,
      required this.onPressed,
      required this.text,
      this.widthRatio = 0.6})
      : super(key: key);

  final VoidCallback onPressed;
  final String text;
  final double widthRatio;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InformerWidget(
        onPageBuild: (context, info) {
          return GestureDetector(
            onTap: onPressed,
            child: Container(
              width: info.screenSize.width * widthRatio,
              child: buildColumn(context),
            ),
          );
        },
      ),
    );
  }

  Column buildColumn(BuildContext context) {
    return Column(
              children: [
                Expanded(
                  flex: 10,
                  child: Container(
                    color: context.secondaryColor,
                  ),
                ),
                Expanded(
                  flex: 80,
                  child: buildAutoSizeText(context),
                ),
                Expanded(
                  flex: 10,
                  child: Container(
                    color: context.secondaryColor,
                  ),
                ),
              ],
            );
  }

  Center buildAutoSizeText(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(context.padding4),
        child: CustomAutoSizeText(
          text: text,
        ),
      ),
    );
  }
}
