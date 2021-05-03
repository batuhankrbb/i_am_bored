import 'package:flutter/material.dart';
import 'package:im_bored_app/core/user_interface/responsive_layout/widgets/informer_widget.dart';
import 'package:im_bored_app/features/activities/presentation/components/custom_text.dart';
import 'package:im_bored_app/core/user_interface/extensions/context_extension.dart';

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
              child: Column(
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
              ),
            ),
          );
        },
      ),
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
