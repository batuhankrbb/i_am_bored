import 'package:flutter/material.dart';

import '../../../../../../../core/navigation/routes/navigation_routes.dart';
import '../../../../../../../core/navigation/services/navigation_service.dart';
import '../../../../../../../core/user_interface/extensions/context_extension.dart';
import '../../../../../../../core/user_interface/responsive_layout/widgets/informer_widget.dart';
import '../../../../components/custom_big_text.dart';
import '../../../../components/custom_bold_text_button.dart';
import '../../../../components/custom_bordered_button.dart';
import '../../../../components/custom_text_button.dart';
import '../../../favorites/pages/favorite_activities_page/favorite_activities_page.dart';
import '../activity_detail_page/activity_detail_page.dart';
import '../im_not_page/im_not_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<HomePage> {
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

   Container buildGetFavoritesButton() {
    return Container(
      padding: EdgeInsets.all(4),
      child: CustomBorderedButton(
        text: "Give me my favorites",
        onPressed: () {
          NavigationService().navigateTo(
            NavigationRoute.favoritesPage(FavoriteActivitiesPage()),
          );
        },
      ),
    );
  }

  Widget buildImNotButton() {
    return Padding(
      padding: EdgeInsets.all(context.customPadding(3)),
      child: CustomTextButton(
        text: "Nah, I'm not.",
        onPressed: () {
          NavigationService().navigateTo(
            NavigationRoute.iAmNotBoredPage(IAmNotBoredPage()),
          );
        },
      ),
    );
  }

  Widget buildImBoredButton() {
    return CustomBoldTextButton(
        text: "I'm sooo bored",
        onPressed: () {
          NavigationService().navigateTo(
            NavigationRoute.activityDetailPage(ActivityDetailPage()),
          );
        });
  }
}
