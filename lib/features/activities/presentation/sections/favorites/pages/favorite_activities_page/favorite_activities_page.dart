import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:im_bored_app/core/navigation/routes/navigation_routes.dart';
import 'package:im_bored_app/core/navigation/services/navigation_service.dart';
import 'package:im_bored_app/features/activities/domain/entities/activity_entity.dart';
import 'package:im_bored_app/features/activities/presentation/components/custom_app_bar.dart';
import 'package:im_bored_app/features/activities/presentation/components/custom_big_text.dart';
import 'package:im_bored_app/features/activities/presentation/components/loading_indicator.dart';
import 'package:im_bored_app/features/activities/presentation/sections/favorites/pages/favorite_activities_page/components/favorite_activity_failure.dart';
import 'package:im_bored_app/features/activities/presentation/sections/favorites/pages/favorites_detail_page/favorites_detail_page.dart';
import 'package:im_bored_app/features/activities/presentation/sections/favorites/viewmodel/favorites_viewmodel.dart';
import 'package:im_bored_app/features/activities/starting_files/get_it_injection_container.dart';
import '../../../../components/custom_text.dart';
import '../../../../../../../core/user_interface/extensions/context_extension.dart';
import 'components/favorite_activity_list_cell.dart';

class FavoriteActivitiesPage extends StatefulWidget {
  FavoriteActivitiesPage({Key? key}) : super(key: key);

  @override
  _FavoriteActivitiesPageState createState() => _FavoriteActivitiesPageState();
}

class _FavoriteActivitiesPageState extends State<FavoriteActivitiesPage> {
  var _favoriteViewModel = getit.get<FavoritesViewModel>();

  @override
  void initState() {
    super.initState();
    _favoriteViewModel.setContext(context);
    _favoriteViewModel.getAllFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
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
              child: buildResult(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildResult() {
    return Observer(builder: (_) {
      return _favoriteViewModel.favoriteActivities.when(initial: () {
        return LoadingIndicator();
      }, loading: () {
        return LoadingIndicator();
      }, completed: (result) {
        return buildListView(result);
      }, failed: (failure) {
        return FavoriteActivityFailure(failureMessage: failure.message);
      });
    });
  }

  Widget buildListView(List<ActivityEntity> entities) {
    return Observer(builder: (_) {
      return ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: context.padding16),
            child: FavoriteActivityListCell(
              entity: entities[index],
              onPressed: () {
                goDetails(entities[index]);
              },
              onDismissed: _favoriteViewModel.onDismiss,
            ),
          );
        },
        itemCount: entities.length,
        physics: BouncingScrollPhysics(),
      );
    });
  }

  Widget buildBigText() {
    return Container(
      padding: EdgeInsets.only(left: context.padding12),
      child: CustomBigText(
        texts: ["Wow,", "you have", "impeccable", "taste"],
      ),
    );
  }

  void goDetails(ActivityEntity entity) {
    NavigationService().navigateTo(
      NavigationRoute.favoriteDetailPage(
        ActivityFavoriteDetailPage(
          entity: entity,
        ),
      ),
    );
  }
}
