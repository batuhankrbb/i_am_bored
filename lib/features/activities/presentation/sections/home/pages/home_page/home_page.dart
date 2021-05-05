import 'package:flutter/material.dart';
import 'package:im_bored_app/core/user_interface/responsive_layout/widgets/informer_widget.dart';
import '../../../../../../../core/base/base_state.dart';
import '../../../../../../../core/user_interface/extensions/context_extension.dart';
import '../../../../components/custom_big_text.dart';
import '../../../../components/custom_bold_text_button.dart';
import '../../../../components/custom_bordered_button.dart';
import '../../../../components/custom_text_button.dart';

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
          padding: EdgeInsets.symmetric(
              vertical: context.padding4, horizontal: context.padding8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(
                flex: 15,
              ),
              Expanded(
                flex: 40,
                child: buildBigText(),
              ),
              Spacer(
                flex: 14,
              ),
              Expanded(
                flex: 6,
                child: buildImBoredButton(),
              ),
              Spacer(
                flex: 2,
              ),
              Expanded(
                flex: 6,
                child: buildImNotButton(),
              ),
              Spacer(
                flex: 4,
              ),
              Expanded(
                flex: 7,
                child: buildGetFavoritesButton(),
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

  Container buildGetFavoritesButton() {
    return Container(
      padding: EdgeInsets.all(4),
      child: CustomBorderedButton(
        text: "Give me my favorites",
        onPressed: () {},
      ),
    );
  }

  Widget buildBigText() {
    return InformerWidget(onPageBuild: (context, info) {
      return Container(
        width: info.screenSize.width * 0.85,
        child: CustomBigText(texts: [
          "So,",
          "are you",
          "bored?",
        ]),
      );
    });
  }

  Widget buildImNotButton() {
    return Padding(
      padding: EdgeInsets.all(context.customPadding(3)),
      child: CustomTextButton(
        text: "Nah, I'm not.",
        onPressed: () {},
      ),
    );
  }

  Widget buildImBoredButton() {
    return CustomBoldTextButton(text: "I'm sooo bored", onPressed: () {});
  }
}
