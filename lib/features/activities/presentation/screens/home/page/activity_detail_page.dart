import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:im_bored_app/core/user_interface/responsive_layout/widgets/informer_widget.dart';

import 'package:im_bored_app/core/user_interface/extensions/context_extension.dart';
import 'package:im_bored_app/features/activities/presentation/components/molecules/custom_bold_text_button.dart';
import 'package:im_bored_app/features/activities/presentation/components/molecules/custom_bordered_button.dart';
import 'package:im_bored_app/features/activities/presentation/components/molecules/custom_text.dart';
import 'package:im_bored_app/features/activities/presentation/components/molecules/custom_text_button.dart';
import 'package:im_bored_app/features/activities/presentation/components/molecules/custom_text_button_between_lines.dart';


class ActivityDetailPage extends StatefulWidget {
  ActivityDetailPage({Key? key}) : super(key: key);

  @override
  _ActivityDetailPageState createState() => _ActivityDetailPageState();
}

class _ActivityDetailPageState extends State<ActivityDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(context.padding6),
          child: Column(
            children: [
              Spacer(
                flex: 8,
              ),
              Expanded(
                flex: 40,
                child: buildCustomActivityBigText(),
              ),
              Spacer(
                flex: 6,
              ),
              Expanded(
                flex: 22,
                child: buildActivityInfoTexts(context),
              ),
              Spacer(
                flex: 1,
              ),
              Expanded(
                flex: 7,
                child: CustomBorderedButton(
                    text: "I like it. Add to my favorites", onPressed: () {}),
              ),
              Spacer(
                flex: 12,
              ),
              Expanded(
                flex: 22,
                child: buildButtons(context),
              ),
              Spacer(
                flex: 5,
              ),
              Expanded(
                flex: 7,
                child: CustomTextButtonBetweenLines(
                  text: "current type: relaxation",
                  onPressed: () {
                    print("clickeddd");
                  },
                ),
              ),
              Spacer(
                flex: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column buildButtons(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 6,
          child: CustomBoldTextButton(
            text: "Give me another one",
            onPressed: () {},
          ),
        ),
        Spacer(),
        Expanded(
          flex: 7,
          child: buildCustomTextButton(),
        )
      ],
    );
  }

  Widget buildCustomTextButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.padding12),
      child: CustomTextButton(
          text: "Give me another one with a spesific type",
          maxLine: 2,
          textAlign: TextAlign.center,
          onPressed: () {}),
    );
  }

  Padding buildActivityInfoTexts(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.padding16),
      child: Column(
        children: [
          Expanded(
            child: CustomAutoSizeText(
              text: "You need 1+ person to do it",
            ),
          ),
          Spacer(),
          Expanded(
            child: CustomAutoSizeText(
              text: "The type of this activity is relaxationasdsadsadas",
            ),
          ),
          Spacer(),
          Expanded(
            child: CustomAutoSizeText(
              text: "This activity is more expensive than %25 activities",
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  CustomAutoSizeText buildCustomActivityBigText() {
    return CustomAutoSizeText(
      text: "Create a cookbok asdadsadasdsad asdasdas adsdasd bbbb fff ",
      fontSize: 44,
      maxLines: null,
    );
  }
}
