import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:im_bored_app/core/user_interface/extensions/context_extension.dart';
import 'package:im_bored_app/features/activities/presentation/components/molecules/custom_text.dart';

class IAmNotBoredPage extends StatefulWidget {
  IAmNotBoredPage({Key? key}) : super(key: key);

  @override
  _IAmNotBoredPageState createState() => _IAmNotBoredPageState();
}

class _IAmNotBoredPageState extends State<IAmNotBoredPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(context.padding4),
          child: Column(
            children: [
              Spacer(
                flex: 10,
              ),
              Expanded(
                flex: 45,
                child: Container(
                  color: Colors.green,
                ),
              ),
              Spacer(
                flex: 7,
              ),
              Expanded(
                flex: 30,
                child: buildMiddleTextWithBorder(),
              ),
              Spacer(
                flex: 2,
              ),
              Expanded(
                flex: 8,
                child: buildBottomText(context),
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

  CustomAutoSizeText buildBottomText(BuildContext context) {
    return CustomAutoSizeText(
      text: "I'm sad to see that you are going :(",
      fontFamily: context.coolveticaFont,
      padding: context.padding8,
    );
  }

  Widget buildMiddleTextWithBorder() {
    return Padding(
      padding: EdgeInsets.all(context.padding8),
      child: Container(
        alignment: Alignment.center,
        decoration: buildBoxDecoration(),
        child: CustomAutoSizeText(
          text:
              "You've already found something to enjoy. I appreciate you. So, there is no need to use this application anymore. See you when you are bored.",
          maxLines: null,
          padding: context.padding12,
          fontFamily: context.coolveticaFont,
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
        border: Border.all(width: 2, color: context.secondaryColor),
        borderRadius: BorderRadius.circular(12));
  }
}
