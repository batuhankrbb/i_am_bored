import 'package:flutter/material.dart';
import 'package:im_bored_app/core/constants/custom_colors.dart';
import 'package:im_bored_app/features/activities/domain/entities/activity_entity.dart';
import '../../../../../../../../core/user_interface/responsive_layout/utils/device_enums.dart';
import '../../../../../../../../core/user_interface/responsive_layout/widgets/informer_widget.dart';
import '../../../../../../../../core/user_interface/extensions/context_extension.dart';
import '../../../../../components/custom_text.dart';
import 'package:im_bored_app/core/user_interface/responsive_layout/utils/screen_information_model.dart';

class FavoriteActivityListCell extends StatelessWidget {
  const FavoriteActivityListCell(
      {Key? key,
      required this.entity,
      required this.onPressed,
      required this.onDismissed})
      : super(key: key);

  final ActivityEntity entity;
  final VoidCallback onPressed;
  final Function(DismissDirection dismissDirection) onDismissed;

  @override
  Widget build(BuildContext context) {
    return InformerWidget(onPageBuild: (context, info) {
      return Dismissible(
        key: Key(entity.key),
        onDismissed: onDismissed,
        direction: DismissDirection.endToStart,
        background: Container(
          color: CustomColor().red,
        ),
        child: GestureDetector(
          onTap: onPressed,
          child: Container(
            height: info.screenSize.height * 0.1,
            alignment: Alignment.center,
            child: Row(
              children: [
                Spacer(
                  flex: 2,
                ),
                Expanded(
                  flex: 1,
                  child: buildWhiteVerticalLine(info, context),
                ),
                Spacer(
                  flex: 2,
                ),
                Expanded(
                  flex: 70,
                  child: buildText(context),
                ),
                Spacer(
                  flex: 2,
                ),
                Expanded(
                  flex: 8,
                  child: buildIcon(info),
                ),
                Spacer(
                  flex: 3,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget buildIcon(ScreenInformation info) {
    return InformerWidget(onPageBuild: (context, info) {
      return Container(
        alignment: Alignment.center,
        child: Icon(
          Icons.chevron_right_rounded,
          size: info.boundsSize.height * 0.6,
        ),
      );
    });
  }

  Widget buildText(BuildContext context) {
    return InformerWidget(onPageBuild: (context, info) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: context.padding6),
        child: CustomAutoSizeText(
          text: entity.activity,
          fontSize: info.customDeviceType == CustomDeviceType.mobile ? 30 : 50,
          maxLines: 4,
        ),
      );
    });
  }

  Container buildWhiteVerticalLine(
      ScreenInformation info, BuildContext context) {
    return Container(
      color: context.secondaryColor,
    );
  }
}
