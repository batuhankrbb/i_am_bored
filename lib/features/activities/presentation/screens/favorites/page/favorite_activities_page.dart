import 'package:flutter/material.dart';
import 'package:im_bored_app/features/activities/presentation/components/molecules/custom_text.dart';
import 'package:im_bored_app/core/user_interface/extensions/context_extension.dart';
import 'package:im_bored_app/features/activities/presentation/components/organisms/favorite_activity_list_cell.dart';

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
              child: CustomAutoSizeText(
                  text: "Create a cookbook asdsafsaa asdasdas bb fffffasdsa"),
            ),
            Spacer(
              flex: 6,
            ),
            Expanded(
              flex: 54, //54
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: context.padding6),
                    child: FavoriteActivityListCell(
                        text:
                            "Create a cookbook with your favorite receipesasdfsafadsfasdfsddfsafsadfsxx"),
                  );
                },
                itemCount: 10,
                physics: BouncingScrollPhysics(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
