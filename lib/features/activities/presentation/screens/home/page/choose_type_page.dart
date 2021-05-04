import 'package:flutter/material.dart';
import 'package:im_bored_app/core/user_interface/extensions/context_extension.dart';
import 'package:im_bored_app/core/user_interface/responsive_layout/widgets/informer_widget.dart';
import 'package:im_bored_app/features/activities/presentation/components/bounded_auto_size_text.dart';
import 'package:im_bored_app/features/activities/presentation/components/custom_text.dart';
import 'package:im_bored_app/features/activities/utils/activity_types.dart';

class ChooseTypePage extends StatefulWidget {
  ChooseTypePage({Key? key}) : super(key: key);

  @override
  _ChooseTypePageState createState() => _ChooseTypePageState();
}

class _ChooseTypePageState extends State<ChooseTypePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Spacer(
              flex: 7,
            ),
            Expanded(
              flex: 10,
              child: Container(
                color: Colors.blue,
              ),
            ),
            Spacer(
              flex: 5,
            ),
            Expanded(
              flex: 60,
              child: InformerWidget(
                onPageBuild: (context, expandedInfo) {
                  return ListWheelScrollView.useDelegate(
                    itemExtent: expandedInfo.boundsSize.height * 0.17,
                    magnification: 1.3,
                    useMagnifier: true,
                    physics: BouncingScrollPhysics(),
                    childDelegate: ListWheelChildBuilderDelegate(
                      childCount: ActivityType.values.length,
                      builder: (context, index) {
                        return BoundedAutoSizeText(
                          text: ActivityType.values[index].toString(),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            Spacer(
              flex: 18,
            ),
          ],
        ),
      ),
    );
  }
}
