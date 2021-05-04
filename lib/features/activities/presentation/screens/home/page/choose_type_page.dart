import 'package:flutter/material.dart';
import 'package:im_bored_app/core/user_interface/extensions/context_extension.dart';
import 'package:im_bored_app/core/user_interface/responsive_layout/widgets/informer_widget.dart';
import 'package:im_bored_app/features/activities/presentation/components/molecules/bounded_auto_size_text.dart';
import 'package:im_bored_app/features/activities/presentation/components/organisms/text_list_wheel_view.dart';
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
              child: TextListWheelView(
                textList: ActivityType.values.map((e) => e.toString()).toList(),
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
