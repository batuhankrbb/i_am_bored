import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:im_bored_app/features/activities/domain/entities/activity_entity.dart';
import 'package:im_bored_app/features/activities/presentation/components/custom_bordered_button.dart';
import 'package:im_bored_app/features/activities/presentation/components/custom_text.dart';
import 'package:im_bored_app/features/activities/presentation/sections/home/pages/activity_detail_page/components/activity_info_texts.dart';
import 'package:im_bored_app/features/activities/presentation/sections/home/viewmodel/home_view_model.dart';
import 'package:im_bored_app/features/activities/starting_files/get_it_injection_container.dart';
import 'package:im_bored_app/core/user_interface/extensions/context_extension.dart';

class ActivityLoaded extends StatelessWidget {
  ActivityLoaded({Key? key, required this.entity}) : super(key: key);

  HomeViewModel _homeViewModel = getit.get<HomeViewModel>();
  final ActivityEntity entity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(
          flex: 6,
        ),
        Expanded(
          flex: 32,
          child: buildCustomActivityText(entity),
        ),
        Spacer(
          flex: 6,
        ),
        Expanded(
          flex: 35,
          child: buildActivityInfoTexts(context, entity),
        ),
        Spacer(
          flex: 3,
        ),
        Expanded(
          flex: 11,
          child: buildAddToFavoriteButton(),
        ),
      ],
    );
  }

  Padding buildActivityInfoTexts(BuildContext context, ActivityEntity entity) {
    return Padding(
      padding: EdgeInsets.all(context.padding6),
      child: ActivityInfoTexts(
        entity: entity,
      ),
    );
  }

  Widget buildAddToFavoriteButton() {
    return Observer(
      builder: (_) {
        return CustomBorderedButton(
            text: _homeViewModel.isCurrentActivityFavorite
                ? "remove from favorites"
                : "add to my favorites",
            onPressed: () {
              _homeViewModel.favoriteButtonPressed(entity);
            });
      },
    );
  }

  Widget buildCustomActivityText(ActivityEntity entity) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6),
      child: CustomAutoSizeText(
        text: entity.activity,
        fontSize: 100,
        maxLines: null,
      ),
    );
  }
}
