import 'package:flutter/material.dart';
import '../../../../../../../../core/user_interface/responsive_layout/widgets/informer_widget.dart';
import '../../../../../components/custom_text.dart';

class BoundedAutoSizeText extends StatelessWidget {
  const BoundedAutoSizeText(
      {Key? key,
      required this.text,
      this.widthRatio = 0.5,
      this.heightRatio = 0.5})
      : super(key: key);

  final String text;
  final double widthRatio;
  final double heightRatio;

  @override
  Widget build(BuildContext context) {
    return InformerWidget(onPageBuild: (context, info) {
      return Container(
        width: info.boundsSize.width * widthRatio,
        height: info.boundsSize.height * heightRatio,
        child: CustomAutoSizeText(
          textAlign: TextAlign.center,
          text: text,
        ),
      );
    });
  }
}
