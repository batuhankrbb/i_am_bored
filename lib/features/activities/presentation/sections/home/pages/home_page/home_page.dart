import 'package:flutter/material.dart';
import 'package:im_bored_app/core/base/base_state.dart';
import 'package:im_bored_app/core/user_interface/extensions/context_extension.dart';
import 'package:im_bored_app/features/activities/presentation/components/molecules/custom_big_text.dart';
import 'package:im_bored_app/features/activities/presentation/components/molecules/custom_bold_text_button.dart';
import 'package:im_bored_app/features/activities/presentation/components/molecules/custom_bordered_button.dart';
import 'package:im_bored_app/features/activities/presentation/components/molecules/custom_text_button.dart';


class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends BaseState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(context.padding4),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(
                flex: 15,
              ),
              Expanded(
                flex: 40,
                child: Padding(
                    padding: EdgeInsets.all(4.0),
                    child: CustomBigText(texts: ["So,", "are you", "bored"])),
              ),
              Spacer(
                flex: 14,
              ),
              Expanded(
                flex: 6,
                child: CustomBoldTextButton(
                    text: "I'm sooo bored", onPressed: () {}),
              ),
              Spacer(),
              Expanded(
                flex: 6,
                child: CustomTextButton(
                  text: "Nah, I'm not.",
                  onPressed: () {},
                ),
              ),
              Spacer(
                flex: 4,
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: EdgeInsets.all(context.padding2),
                  child: CustomBorderedButton(
                    text: "Give me my favorites",
                    onPressed: () {},
                  ),
                ),
              ),
              Spacer(
                flex: 6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
