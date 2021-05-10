import 'package:flutter/material.dart';

import '../../../../../../domain/entities/activity_entity.dart';
import '../../../../../components/custom_text.dart';

class ActivityInfoTexts extends StatelessWidget {
  const ActivityInfoTexts({Key? key, required this.entity}) : super(key: key);

  final ActivityEntity entity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Expanded(
          flex: 2,
          child: CustomAutoSizeText(
            text: entity.personText,
          ),
        ),
        Spacer(),
        Expanded(
          flex: 2,
          child: CustomAutoSizeText(
            text: entity.typeText,
          ),
        ),
        Spacer(),
        Expanded(
          flex: 2,
          child: CustomAutoSizeText(
            text: entity.expensiveText,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
        Spacer(),
      ],
    );
  }
}
