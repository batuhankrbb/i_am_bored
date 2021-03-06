import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../core/user_interface/extensions/context_extension.dart';
import '../../../../core/user_interface/responsive_layout/utils/screen_information_model.dart';
import '../../../../core/user_interface/responsive_layout/widgets/informer_widget.dart';

class CustomBigText extends StatelessWidget {
  const CustomBigText({Key? key, required this.texts, this.alignment})
      : super(key: key);

  final List<String> texts;
  final Alignment? alignment;

  @override
  Widget build(BuildContext context) {
    return InformerWidget(onPageBuild: (context, info) {
      return Container(
        height: info.boundsSize.height,
        width: info.boundsSize.width,
        child: buildListView(info),
      );
    });
  }

  Widget buildListView(ScreenInformation info) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return BoundedBigTextContainer(
          texts: texts,
          info: info,
          index: index,
          alignment: alignment,
        );
      },
      itemCount: texts.length,
      physics: NeverScrollableScrollPhysics(),
    );
  }
}

class BoundedBigTextContainer extends StatelessWidget {
  const BoundedBigTextContainer(
      {Key? key,
      required this.texts,
      required this.info,
      required this.index,
      this.alignment})
      : super(key: key);

  final List<String> texts;
  final ScreenInformation info;
  final int index;
  final Alignment? alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment ?? Alignment.centerLeft,
      height: info.boundsSize.height / texts.length,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: context.padding2),
        child: AutoSizeText(
          texts[index],
          style: TextStyle(
            color: context.secondaryColor,
            fontSize: 300,
          ),
          minFontSize: 25,
        ),
      ),
    );
  }
}

/*

*/
