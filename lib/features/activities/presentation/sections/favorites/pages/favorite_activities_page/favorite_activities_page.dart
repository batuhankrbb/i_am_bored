import 'package:flutter/material.dart';
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
