import 'package:flutter/material.dart';
import '../../../../components/custom_bold_text_button.dart';
import '../../../../components/custom_text.dart';
import '../../../../../../../core/user_interface/extensions/context_extension.dart';

class ActivityFavoriteDetailPage extends StatefulWidget {
  ActivityFavoriteDetailPage({Key? key}) : super(key: key);

  @override
  _ActivityFavoriteDetailPageState createState() =>
      _ActivityFavoriteDetailPageState();
}

class _ActivityFavoriteDetailPageState
    extends State<ActivityFavoriteDetailPage> {
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
                flex: 45,
                child: buildCustomTopText(),
              ),
              Spacer(
                flex: 8,
              ),
              Expanded(
                flex: 35,
                child: buildActivityInfoTexts(),
              ),
              Spacer(
                flex: 7,
              ),
              Expanded(
                flex: 20,
                child: buildButtonAndText(context),
              ),
              Spacer(
                flex: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCustomTopText() {
    return Container(
      padding: EdgeInsets.only(left: context.padding8, right: context.padding4),
      child: CustomAutoSizeText(
        text: "Create a cookbook that is your favorite you mf",
        fontSize: 100,
        maxLines: null,
      ),
    );
  }

  Container buildButtonAndText(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.padding8),
      child: Column(
        children: [
          Expanded(
            flex: 15,
            child: CustomAutoSizeText(
              text: "if you are tired of doing this",
              fontSize: 60,
            ),
          ),
          Spacer(
            flex: 8,
          ),
          Expanded(
              flex: 25,
              child: CustomBoldTextButton(
                  text: "remove from favorites", onPressed: () {}))
        ],
      ),
    );
  }

  Widget buildActivityInfoTexts() {
    return Container(
      padding: EdgeInsets.all(context.padding8),
      child: Column(
        children: [
          Spacer(),
          Expanded(
            flex: 4,
            child: CustomAutoSizeText(
              text: "You need 1+ person to do it",
            ),
          ),
          Spacer(),
          Expanded(
            flex: 4,
            child: CustomAutoSizeText(
              text: "The type of this activity is relaxation",
              fontSize: 60,
            ),
          ),
          Spacer(),
          Expanded(
            flex: 4,
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
}
