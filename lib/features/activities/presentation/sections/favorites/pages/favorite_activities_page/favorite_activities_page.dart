import 'package:flutter/material.dart';
import 'package:im_bored_app/features/activities/presentation/components/custom_big_text.dart';
import '../../../../components/custom_text.dart';
import '../../../../../../../core/user_interface/extensions/context_extension.dart';
import 'components/favorite_activity_list_cell.dart';

class FavoriteActivitiesPage extends StatefulWidget {
  FavoriteActivitiesPage({Key? key}) : super(key: key);

  @override
  _FavoriteActivitiesPageState createState() => _FavoriteActivitiesPageState();
}

class _FavoriteActivitiesPageState extends State<FavoriteActivitiesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Spacer(
              flex: 4,
            ),
            Expanded(
              flex: 40,
              child: buildBigText(),
            ),
            Spacer(
              flex: 6,
            ),
            Expanded(
              flex: 54,
              child: buildListView(),
            ),
          ],
        ),
      ),
    );
  }

  ListView buildListView() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: context.padding16),
          child: FavoriteActivityListCell(
            text: "Create a cookbook with your favorite",
          ),
        );
      },
      itemCount: 10,
      physics: BouncingScrollPhysics(),
    );
  }

  Widget buildBigText() {
    return Container(
      padding: EdgeInsets.only(left: context.padding12),
      child: CustomBigText(
        texts: ["Wow,", "you have", "impeccable", "taste"],
      ),
    );
  }
}
