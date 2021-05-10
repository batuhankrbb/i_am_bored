import 'package:flutter/material.dart';

import '../../../../../../../core/user_interface/extensions/context_extension.dart';
import '../../../../../domain/entities/activity_entity.dart';
import '../../../../components/custom_app_bar.dart';
import '../../../../components/custom_text.dart';
import 'components/favorite_activity_info_text.dart';

class ActivityFavoriteDetailPage extends StatefulWidget {
  ActivityFavoriteDetailPage({Key? key, required this.entity})
      : super(key: key);

  @override
  _ActivityFavoriteDetailPageState createState() =>
      _ActivityFavoriteDetailPageState();

  final ActivityEntity entity;
}

class _ActivityFavoriteDetailPageState
    extends State<ActivityFavoriteDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
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
                flex: 45,
                child: FavoriteActivityInfoTexts(
                  entity: widget.entity,
                ),
              ),
              Spacer(
                flex: 7,
              ),
              Spacer(
                flex: 25,
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
        text: widget.entity.activity,
        fontSize: 100,
        maxLines: null,
      ),
    );
  }
}
