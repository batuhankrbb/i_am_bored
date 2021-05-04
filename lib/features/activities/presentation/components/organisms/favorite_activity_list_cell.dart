import 'package:flutter/material.dart';
import 'package:im_bored_app/core/user_interface/responsive_layout/utils/device_enums.dart';
import 'package:im_bored_app/core/user_interface/responsive_layout/widgets/informer_widget.dart';
import 'package:im_bored_app/features/activities/presentation/components/molecules/custom_text.dart';
import 'package:im_bored_app/core/user_interface/extensions/context_extension.dart';

class FavoriteActivityListCell extends StatelessWidget {
  const FavoriteActivityListCell({Key? key, required this.text})
      : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return InformerWidget(onPageBuild: (context, info) {
      return Container(
        height: info.screenSize.height * 0.1,
        alignment: Alignment.center,
        child: Row(
          children: [
            Spacer(
              flex: 2,
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: info.screenSize.height * 0.08,
                color: context.secondaryColor,
              ),
            ),
            Spacer(
              flex: 2,
            ),
            Expanded(
              flex: 70,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: context.padding6),
                child: CustomAutoSizeText(
                  text: text,
                  maxLines: 3,
                ),
              ),
            ),
            Spacer(
              flex: 6,
            ),
            Expanded(
              flex: 14,
              child: Center(
                child: Icon(
                  Icons.chevron_right_rounded,
                  size: info.customDeviceType == CustomDeviceType.mobile
                      ? 50
                      : 80,
                ),
              ),
            ),
            Spacer(
              flex: 3,
            ),
          ],
        ),
      );
    });
  }
}
