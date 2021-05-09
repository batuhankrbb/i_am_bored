import 'package:flutter/material.dart';
import 'package:im_bored_app/features/activities/presentation/components/custom_text.dart';

class ActivityInitial extends StatelessWidget {
  const ActivityInitial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(
          flex: 5,
        ),
        Expanded(
          flex: 50,
          child: CustomAutoSizeText(
            text: "i think you should click one of the buttons below",
            maxLines: 4,
            fontSize: 100,
          ),
        ),
        Spacer(
          flex: 5,
        ),
      ],
    );
  }
}
