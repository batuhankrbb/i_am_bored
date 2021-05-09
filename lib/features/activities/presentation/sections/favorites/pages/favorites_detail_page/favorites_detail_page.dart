import 'package:flutter/material.dart';
import 'package:im_bored_app/core/navigation/services/navigation_service.dart';
import 'package:im_bored_app/features/activities/domain/entities/activity_entity.dart';
import 'package:im_bored_app/features/activities/presentation/components/custom_app_bar.dart';
import 'package:im_bored_app/features/activities/presentation/sections/favorites/pages/favorites_detail_page/components/favorite_activity_info_text.dart';
import 'package:im_bored_app/features/activities/presentation/sections/favorites/viewmodel/favorites_viewmodel.dart';
import 'package:im_bored_app/features/activities/starting_files/get_it_injection_container.dart';
import '../../../../components/custom_bold_text_button.dart';
import '../../../../components/custom_text.dart';
import '../../../../../../../core/user_interface/extensions/context_extension.dart';

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
