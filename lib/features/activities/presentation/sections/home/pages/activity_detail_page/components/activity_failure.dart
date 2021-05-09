import 'package:flutter/material.dart';
import 'package:im_bored_app/features/activities/presentation/components/custom_text.dart';
import 'package:im_bored_app/core/user_interface/extensions/context_extension.dart';

class ActivityFailure extends StatelessWidget {
  const ActivityFailure({Key? key, required this.failureMessage})
      : super(key: key);

  final String failureMessage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: context.padding6),
      child: Column(
        children: [
          Spacer(
            flex: 5,
          ),
          Expanded(
            flex: 50,
            child: CustomAutoSizeText(
              text: failureMessage,
              maxLines: 4,
              fontSize: 100,
              color: context.errorColor,
            ),
          ),
          Spacer(
            flex: 5,
          ),
        ],
      ),
    );
  }
}
