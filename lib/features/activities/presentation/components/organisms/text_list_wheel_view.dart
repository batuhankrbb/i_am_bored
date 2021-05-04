import 'package:flutter/material.dart';
import 'package:im_bored_app/core/user_interface/responsive_layout/widgets/informer_widget.dart';
import 'package:im_bored_app/features/activities/presentation/components/molecules/bounded_auto_size_text.dart';
import 'package:im_bored_app/features/activities/utils/activity_types.dart';

class TextListWheelView extends StatelessWidget {

  const TextListWheelView({Key? key, required this.textList}) : super(key: key);

  final List<String> textList;

  @override
  Widget build(BuildContext context) {
    return InformerWidget(
      onPageBuild: (context, expandedInfo) {
        return ListWheelScrollView.useDelegate(
          itemExtent: expandedInfo.boundsSize.height * 0.17,
          magnification: 1.3,
          useMagnifier: true,
          physics: BouncingScrollPhysics(),
          childDelegate: ListWheelChildBuilderDelegate(
            childCount: textList.length,
            builder: (context, index) {
              return BoundedAutoSizeText(
                text: textList[index],
              );
            },
          ),
        );
      },
    );
  }
}
