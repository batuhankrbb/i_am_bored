import 'package:flutter/material.dart';
import '../../../../components/custom_bold_text_button.dart';
import '../../../../components/custom_bordered_button.dart';
import '../../../../components/custom_text.dart';
import '../../../../components/custom_text_button.dart';
import '../../../../../../../core/user_interface/extensions/context_extension.dart';

import 'components/custom_text_button_between_lines.dart';

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
                child: buildCustomActivityText(),
              ),
              Spacer(
                flex: 6,
              ),
              Expanded(
                flex: 26,
                child: buildActivityInfoTexts(context),
              ),
              Spacer(
                flex: 3,
              ),
              Expanded(
                flex: 8,
                child: buildAddToFavoriteButton(),
              ),
              Spacer(
                flex: 12,
              ),
              Expanded(
                flex: 22,
                child: buildButtons(context),
              ),
              Spacer(
                flex: 7,
              ),
              Expanded(
                flex: 7,
                child: buildCurrentTypeButton(),
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

  CustomTextButtonBetweenLines buildCurrentTypeButton() {
    return CustomTextButtonBetweenLines(
      text: "current type: relaxation",
      onPressed: () {
        print("clickeddd");
      },
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
        Spacer(
          flex: 2,
        ),
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
      padding: EdgeInsets.all(context.padding6),
      child: Column(
        children: [
          Spacer(),
          Expanded(
            flex: 2,
            child: CustomAutoSizeText(
              text: "You need 1+ person to do it",
            ),
          ),
          Spacer(),
          Expanded(
            flex: 2,
            child: CustomAutoSizeText(
              text: "The type of this activity is relaxationasdsadsadas",
            ),
          ),
          Spacer(),
          Expanded(
            flex: 2,
            child: CustomAutoSizeText(
              text: "This activity is more expensive than %25 activities",
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }

  Widget buildCustomActivityText() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: context.padding6),
      child: CustomAutoSizeText(
        text: "Create a cookbok asdfas fads fdasf hello test",
        fontSize: 100,
        maxLines: null,
      ),
    );
  }

  Widget buildAddToFavoriteButton() {
    return CustomBorderedButton(
        text: "I like it. Add to my favorites", onPressed: () {});
  }
}
