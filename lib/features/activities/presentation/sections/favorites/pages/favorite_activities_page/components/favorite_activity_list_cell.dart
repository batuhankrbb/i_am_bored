import 'package:flutter/material.dart';

import '../../../../../../../../core/constants/custom_colors.dart';
import '../../../../../../../../core/user_interface/extensions/context_extension.dart';
import '../../../../../../../../core/user_interface/responsive_layout/utils/device_enums.dart';
import '../../../../../../../../core/user_interface/responsive_layout/utils/screen_information_model.dart';
import '../../../../../../../../core/user_interface/responsive_layout/widgets/informer_widget.dart';
import '../../../../../../domain/entities/activity_entity.dart';
import '../../../../../components/custom_text.dart';

class FavoriteActivityListCell extends StatelessWidget {
  const FavoriteActivityListCell(
      {Key? key,
      required this.entity,
      required this.onPressed,
      required this.onDismissed,required this.index})
      : super(key: key);

  final ActivityEntity entity;
  final VoidCallback onPressed;
  final int index;
  final Function(DismissDirection dismissDirection, int index) onDismissed;

  @override
  Widget build(BuildContext context) {
    return InformerWidget(onPageBuild: (context, info) {
      return Dismissible(
        key: Key(entity.key),
        onDismissed: (direction) {
          print("burada ${direction.index}}");
          onDismissed(direction,index);
        },
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
