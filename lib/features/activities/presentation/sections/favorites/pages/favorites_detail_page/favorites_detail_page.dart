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
                flex: 12,
              ),
              Expanded(
                flex: 40,
                child: CustomAutoSizeText(
                  text: "Create a cookbook that is your favorite you mf",
                  maxLines: null,
                ),
              ),
              Spacer(
                flex: 8,
              ),
              Expanded(
                flex: 25,
                child: buildActivityInfoTexts(),
              ),
              Spacer(
                flex: 10,
              ),
              Expanded(
                flex: 20,
                child: Container(
                  padding: EdgeInsets.all(context.padding6),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 20,
                        child: CustomAutoSizeText(
                          text: "I'm tired of doing this",
                          fontSize: 60,
                        ),
                      ),
                      Spacer(
                        flex: 12,
                      ),
                      Expanded(
                          flex: 30,
                          child: CustomBoldTextButton(
                              text: "remove from favorites", onPressed: () {}))
                    ],
                  ),
                ),
              ),
              Spacer(
                flex: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildActivityInfoTexts() {
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
}
