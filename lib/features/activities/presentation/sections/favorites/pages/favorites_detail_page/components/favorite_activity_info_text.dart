import 'package:flutter/material.dart';
import 'package:im_bored_app/features/activities/domain/entities/activity_entity.dart';
import 'package:im_bored_app/features/activities/presentation/components/custom_text.dart';
import 'package:im_bored_app/core/user_interface/extensions/context_extension.dart';

class FavoriteActivityInfoTexts extends StatelessWidget {
  const FavoriteActivityInfoTexts({Key? key, required this.entity})
      : super(key: key);

  final ActivityEntity entity;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.padding8),
      child: Column(
        children: [
          Spacer(),
          Expanded(
            child: Container(
              color: context.secondaryColor,
            ),
          ),
          Spacer(
            flex: 10,
          ),
          Expanded(
            flex: 12,
            child: CustomAutoSizeText(
              text: entity.personText,
            ),
          ),
          Spacer(),
          Expanded(
            flex: 12,
            child: CustomAutoSizeText(
              text: entity.typeText,
              fontSize: 60,
            ),
          ),
          Spacer(
            flex: 3,
          ),
          Expanded(
            flex: 12,
            child: CustomAutoSizeText(
              text: entity.expensiveText,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
          Spacer(
            flex: 3,
          ),
        ],
      ),
    );
  }
}
